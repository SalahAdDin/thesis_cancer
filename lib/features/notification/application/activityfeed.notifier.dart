import 'dart:async';

import 'package:colorize/colorize.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.notifier.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/application/settings.notifier.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.provider.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.state.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';
import 'package:thesis_cancer/features/notification/infrastructure/failure.dart';
import 'package:thesis_cancer/features/survey/presentation/pages/survey_screen.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/features/user/domain/profile.repository.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.repository.dart';
import 'package:thesis_cancer/features/user/presentation/pages/profile_screen.dart';

///
class ActivityFeedNotifier extends StateNotifier<ActivityFeedState> {
  ///
  ActivityFeedNotifier({
    required this.reader,
  }) : super(const ActivityFeedState.loading()) {
    init();
  }

  ///
  final Reader reader;

  FirebaseMessaging get _firebaseMessaging =>
      reader(firebaseMessagingInstanceProvider);

  Stream<RemoteMessage> get _feedOnMessageProvider =>
      FirebaseMessaging.onMessage;

  LauncherNotifier get _launcherProvider => reader(launcherProvider.notifier);

  ProfileRepository get _profileRepository => reader(profileRepositoryProvider);

  UserRepository get _userRepository => reader(userRepositoryProvider);

  SettingsNotifier get _settingsController =>
      reader(settingsNotifierProvider.notifier);

  ///
  List<ActivityFeed> feeds = <ActivityFeed>[];

  ///
  int get feedsCount => feeds.where((ActivityFeed feed) => !feed.isRead).length;

  late StreamSubscription<RemoteMessage> _onMessageSubscription;

  @override
  void dispose() {
    _onMessageSubscription.cancel();
    super.dispose();
  }

  ///
  Future<void> deliverFeedAction(
    ActivityFeed feed,
    NavigatorState navigatorState,
  ) async {
    switch (feed.type) {
      case ActivityType.NEW_POST:
        final PostType? postType = feed.data!["type"] as PostType?;
        if (postType != null) {
          // pushToPage(navigatorState, widget)
        }
        break;
      case ActivityType.SCHEDULED_SURVEY_REMINDER:
        final String? surveyId = feed.data!["id"] as String?;
        if (surveyId != null) {
          pushToPage(
            navigatorState,
            SurveyScreen(
              onCompleteSurvey: () => navigatorState.pop(),
              surveyID: surveyId,
            ),
          );
        }
        break;
      case ActivityType.NEW_USER_REGISTERED:
        final String? userId = feed.data!["id"] as String?;
        if (userId != null) {
          final User aimedUser = await _userRepository.findById(userId);

          pushToPage(navigatorState, ProfileScreen(user: aimedUser));
        }
        break;
      case ActivityType.SETTINGS_UPDATED:
        _settingsController.getSettings();
        break;
      case ActivityType.USER_CONFIRMED:
        _launcherProvider.signOut();
        break;
    }
  }

  ///
  Future<String?> getAvatarURL(ActivityFeed feed) async {
    if (feed.type == ActivityType.NEW_POST) {
      final String? profileId = feed.data!["author"] as String?;

      if (profileId != null) {
        final Profile authorProfile =
            await _profileRepository.findById(profileId);
        return authorProfile.profilePhoto?.url;
      }

      return null;
    }

    if (feed.type == ActivityType.NEW_USER_REGISTERED) return null;

    return 'none';
  }

  ///
  Future<void> requestPermissions() async {
    final NotificationSettings settings =
        await _firebaseMessaging.requestPermission(
      announcement: true,
      carPlay: true,
      criticalAlert: true,
    );

    if (kDebugMode) {
      late String message;
      if (settings.authorizationStatus == AuthorizationStatus.authorized) {
        message = 'User granted permission.';
      } else if (settings.authorizationStatus ==
          AuthorizationStatus.provisional) {
        message = 'User granted provisional permission.';
      } else {
        message = 'User declined or has not accepted permission.';
      }
      print(Colorize("Notifications: $message").blue());
    }
  }

  ///
  void handleMessage(RemoteMessage message) {
    if (kDebugMode) {
      print(
        Colorize('Notifications:\nHandling a Message ${message.toString()}')
            .blue(),
      );
    }
    final ActivityFeed feed = ActivityFeed.fromJson(message.data);
    feeds.add(feed.copyWith(id: message.messageId));
    state = ActivityFeedState.data(notifications: feeds);
  }

  ///
  bool feedAlreadyExist(RemoteMessage message) =>
      feeds.any((ActivityFeed feed) => feed.id == message.messageId);

  ///
  void readFeed(String id) {
    feeds = feeds
        .map(
          (ActivityFeed feed) =>
              feed.id == id ? feed.copyWith(isRead: true) : feed,
        )
        .toList();
    state = ActivityFeedState.data(notifications: feeds);
  }

  ///
  void init() {
    _firebaseMessaging.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    _firebaseMessaging.getInitialMessage().then(
      (RemoteMessage? message) {
        if (message != null && feedAlreadyExist(message) == false) {
          handleMessage(message);
        }
      },
    );

    _onMessageSubscription = _feedOnMessageProvider.listen(
      handleMessage,
      onError: (Object error, StackTrace trace) {
        if (kDebugMode) {
          print(Colorize('Notifications: ${error.toString()}').red());
        }
        state = ActivityFeedState.error(
          ActivityFeedFailure(reason: ActivityFeedFailureReason.unknown),
        );
      },
      onDone: () => state = const ActivityFeedState.completed(),
    );
  }
}
