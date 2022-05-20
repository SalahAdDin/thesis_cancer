import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/widgets/header.dart';
import 'package:thesis_cancer/core/presentation/widgets/user_avatar.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.provider.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';

///
class NotificationsScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<List<ActivityFeed>> notificationsStream =
        ref.watch(notificationsProvider);
    final FirebaseAnalytics _analytics = ref.watch(firebaseAnalyticsProvider);

    Future<void> _setScreenAnalytics() async {
      await _analytics.setCurrentScreen(
        screenName: "Notifications Screen",
      );
    }

    useEffect(
      () {
        _setScreenAnalytics();

        return null;
      },
      const <Object>[],
    );

    return Scaffold(
      appBar: Header(
        title: const Text('Activity'),
      ),
      body: notificationsStream.when(
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

              // TODO: Notifier provider final avatarUrl = _
              return ListTile(
                title: Text(notification.title),
                subtitle: Text(notification.body),
                leading: notification.type == ActivityType.NEW_USER_REGISTERED
                    ? const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: UserAvatar(
                          userAvatarUrl: null,
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
    );
  }
}
