import 'dart:async';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';
import 'package:uuid/uuid.dart';

///
final AutoDisposeStreamProvider<List<ActivityFeed>> notificationsProvider =
    StreamProvider.autoDispose<List<ActivityFeed>>(
  (AutoDisposeStreamProviderRef<List<ActivityFeed>> ref) async* {
    final List<ActivityFeed> activities = <ActivityFeed>[];
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final ActivityFeed feed =
          ActivityFeed.fromJson(message.data).copyWith(id: const Uuid().v4());
      activities.add(feed);
    });
    yield activities;
  },
  name: "Notifications Stream Provider",
);

///
final AutoDisposeStreamProvider<int> notificationsCountProvider =
    StreamProvider.autoDispose<int>(
  (AutoDisposeStreamProviderRef<int> ref) async* {
    final Stream<List<ActivityFeed>> _notificationsStream =
        ref.watch(notificationsProvider.stream);

    final StreamController<int> notificationsCounter = StreamController<int>();

    _notificationsStream.listen(
      (List<ActivityFeed> notificationsList) => notificationsCounter.add(
        notificationsList.where((ActivityFeed feed) => !feed.isRead).length,
      ),
    );

    ref.onDispose(() => notificationsCounter.close());

    await for (final int value in notificationsCounter.stream) {
      yield value;
    }
  },
  name: "Notifications Count Provider",
);
