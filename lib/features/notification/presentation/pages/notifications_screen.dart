import 'package:colorize/colorize.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/core/presentation/widgets/header.dart';
import 'package:thesis_cancer/core/presentation/widgets/user_avatar.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.notifier.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.provider.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.state.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';
import 'package:thesis_cancer/l10n/l10n.dart';

///
class NotificationsScreen extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ActivityFeedNotifier _notificationsNotifier =
        ref.watch(notificationsProvider.notifier);
    final ActivityFeedState _notificationsState =
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
      body: _notificationsState.when(
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

              String? avatarUrl;

              _notificationsNotifier
                  .getAvatarURL(notification)
                  .then((String? value) {
                avatarUrl = value;
              });

              return ListTile(
                title: Text(notification.title),
                subtitle: Text(notification.body),
                leading: avatarUrl != "none"
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
        error: (Failure? error) => ErrorScreen(
          onPressed: () => Navigator.of(context).maybePop(),
          reason: error?.reason,
          actionLabel: context.l10n!.back,
        ),
        completed: () {
          // TODO: Should we return the ActivityFeed list?
          if (kDebugMode) {
            print(
              Colorize(
                'Notifications: Activity Feed Stream Provider was closed.',
              ).green(),
            );
          }
          return null;
        },
      ),
    );
  }
}
