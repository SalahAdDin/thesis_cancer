import 'dart:async';

import 'package:colorize/colorize.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:socket_io_client/socket_io_client.dart' as io;
import 'package:thesis_cancer/core/domain/constants.dart';
import 'package:thesis_cancer/features/auth/application/auth.provider.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';

final AutoDisposeStreamProvider<List<ActivityFeed>> notificationsProvider =
    StreamProvider.autoDispose<List<ActivityFeed>>(
  (AutoDisposeStreamProviderRef<List<ActivityFeed>> ref) {
    final String authToken = ref.read(tokenProvider).state;

    final StreamController<List<ActivityFeed>> _socketStream =
        StreamController<List<ActivityFeed>>();

    try {
      final io.Socket socket = io.io(
        BackendURL.devURL,
        io.OptionBuilder().setTransports(<String>['websocket'])
            // .disableAutoConnect()
            .setQuery(<String, Object>{'token': authToken}).build(),
      );

      socket.onConnect((_) {
        print(Colorize('Connecting to Socket: ${socket.id}').blue());
        socket.emit("subscribe", "post");
        socket.emit("subscribe", "user");
      });

      //When an event received from server, data is added to the stream
      socket.on(
        'create',
        (data) {
          /*
          TODO:
           1- Parse de incoming data to a proper ActivityFeed.
           2- Add to the notifications stream.
           3- Create a new local notification.
           4- On clicking local notification, mark it as read.
          */

          // streamSocket.addResponse
          print(data);
          // _socketStream.add(data);
        },
      );

      socket.onDisconnect(
        (_) =>
            print(Colorize('Disconnecting from Socket: ${socket.id}').blue()),
      );

      ref.onDispose(() {
        _socketStream.close();
        socket.dispose();
      });
    } catch (error) {
      print(Colorize(error.toString()).red());
    }

    return _socketStream.stream;
  },
  name: "Notifications Stream Provider",
);

final AutoDisposeStreamProvider<int> notificationsCountProvider =
    StreamProvider.autoDispose<int>(
  (AutoDisposeStreamProviderRef<int> ref) async* {
    final Stream<List<ActivityFeed>> _notificationsStream =
        ref.watch(notificationsProvider.stream);

    final StreamController<int> notificationsCounter = StreamController<int>();

    _notificationsStream.listen(
      (List<ActivityFeed> notificationsList) => notificationsCounter.add(
        notificationsList
            .where((ActivityFeed activity) => activity.isRead)
            .length,
      ),
    );

    ref.onDispose(() => notificationsCounter.close());

    await for (final int value in notificationsCounter.stream) {
      yield value;
    }
  },
  name: "Notifications Count Provider",
);
