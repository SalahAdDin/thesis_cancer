import 'dart:async';

import 'package:colorize/colorize.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.notifier.dart';
import 'package:thesis_cancer/core/application/settings.notifier.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.provider.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.state.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';
import 'package:thesis_cancer/features/notification/infrastructure/failure.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/features/user/domain/profile.repository.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.repository.dart';

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

  Stream<RemoteMessage> get _feedProvider => reader(feedProvider.stream);

  LauncherNotifier get _launcherProvider => reader(launcherProvider.notifier);

  ProfileRepository get _profileRepository => reader(profileRepositoryProvider);

  UserRepository get _userRepository => reader(userRepositoryProvider);

  SettingsNotifier get _settingsController =>
      reader(settingsNotifierProvider.notifier);

  ///
  List<ActivityFeed> feeds = <ActivityFeed>[];

  ///
  int get count => feeds.where((ActivityFeed feed) => !feed.isRead).length;

  late StreamSubscription<RemoteMessage> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
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
  Future<void> deliverFeedAction(ActivityFeed feed) async {
    switch (feed.type) {
      case ActivityType.NEW_POST:
        final PostType postType = feed.data!["type"] as PostType;
        break;
      case ActivityType.SCHEDULED_SURVEY_REMINDER:
        final String userId = feed.data!["id"] as String;
        // TODO: Handle this case.
        break;
      case ActivityType.NEW_USER_REGISTERED:
        final String userId = feed.data!["id"] as String;
        final User aimedUser = await _userRepository.findById(userId);

        // TODO: Handle this case.
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
    _subscription = _feedProvider.listen(
      (RemoteMessage message) {
        final ActivityFeed feed = ActivityFeed.fromJson(message.data);
        feeds.add(feed);
        state = ActivityFeedState.data(notifications: feeds);
      },
      onError: (Object error, StackTrace trace) {
        if (kDebugMode) {
          print(Colorize(error.toString()).red());
        }
        state = ActivityFeedState.error(
          ActivityFeedFailure(reason: ActivityFeedFailureReason.unknown),
        );
      },
      onDone: () => state = const ActivityFeedState.completed(),
    );
  }

  /*

  void init() {
    _subscriptionOnCreateSurveyOperation = apiCategory.subscribe(
        request:
            GraphQLRequest<String>(document: graphQLDocumentOnCreateSurvey),
        onData: (event) {
          final Map<String, dynamic> data =
              json.decode(event.data as String) as Map<String, dynamic>;
          final Map<String, dynamic> result =
              data['onCreateSurvey'] as Map<String, dynamic>;
          final ActivityFeed activityFeed = ActivityFeed(
            description:
                'A new survey ${result['title']} is available for you.',
            id: uuid.v4(),
            type: ActivityType.SCHEDULED_SURVEY_REMINDER,
            issuerID: result['id'] as String,
          );
          _notifications.add(activityFeed);
        },
        onEstablished: () {
          print('Subscription established');
        },
        onError: (error) {
          print('Subscription failed with error: $error');
        },
        onDone: () {
          print('Subscription has been closed successfully');
        });
  }*/
}
