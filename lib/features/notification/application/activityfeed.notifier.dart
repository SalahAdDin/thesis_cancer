import 'dart:async';

import 'package:colorize/colorize.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.state.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';
import 'package:thesis_cancer/features/notification/infrastructura/failure.dart';

///
class ActivityFeedNotifier extends StateNotifier<ActivityFeedState> {
  ///
  ActivityFeedNotifier() : super(const ActivityFeedState.loading()) {
    init();
  }

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
    _subscription = FirebaseMessaging.onMessage.listen(
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
