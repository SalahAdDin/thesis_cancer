import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:thesis_cancer/core/presentation/widgets/header.dart';

///
class NotificationsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    /*
    final AsyncValue<List<ActivityFeed>> notificationsStream =
        useProvider(notificationsProvider);
        */

    return Scaffold(
      appBar: Header(
        title: const Text('Activity'),
      ),
      body: Container(),
      /*
      notificationsStream.when(
        data: (List<ActivityFeed> notifications) {
          if (notifications.isEmpty) {
            return Container(
              alignment: Alignment.center,
              child: const Text('No notifications yet!'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            itemCount: notifications.length,
            itemBuilder: (
              BuildContext context,
              int index,
            ) {
              final ActivityFeed notification = notifications[index];

              return ListTile(
                title: Text(notification.description),
                onTap: () {},
                leading: notification.type == ActivityType.NEW_REGISTERED_USER
                    ? const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: UserAvatar(
                          userAvatarUrl: '',
                        ),
                      )
                    : null,
              );
            },
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        // TODO: Error screen with refresh as callback
        error: (Object error, StackTrace? stack) => Center(
          child: Text(error.toString()),
        ),
      ),
      */
    );
  }
}
