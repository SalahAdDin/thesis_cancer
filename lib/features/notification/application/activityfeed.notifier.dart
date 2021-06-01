import 'dart:convert';

import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_flutter/categories/amplify_categories.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.state.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';
import 'package:thesis_cancer/features/survey/infrastructure/survey.gql.dart';
import 'package:uuid/uuid.dart';

class ActivityFeedNotifier extends StateNotifier<ActivityFeedState> {
  ActivityFeedNotifier({required this.apiCategory})
      : super(const ActivityFeedState.loading()) {
    init();
  }

  final APICategory apiCategory;

  GraphQLSubscriptionOperation? _subscriptionOnCreateSurveyOperation;
  GraphQLSubscriptionOperation? _subscriptionOnCreatePostOperation;
  GraphQLSubscriptionOperation? _subscriptionOnCreateCommentOperation;

  List<ActivityFeed> _notifications = [];

  var uuid = Uuid();

  @override
  void dispose() {
    _subscriptionOnCreateSurveyOperation?.cancel();
    _subscriptionOnCreatePostOperation?.cancel();
    _subscriptionOnCreateCommentOperation?.cancel();
    super.dispose();
  }

  void init() {
    _subscriptionOnCreateSurveyOperation = apiCategory.subscribe(
        request:
            GraphQLRequest<String>(document: graphQLDocumentOnCreateSurvey),
        onData: (event) {
          final Map<String, dynamic> data = json.decode(event.data);
          final Map<String, dynamic> result = data['onCreateSurvey'];
          ActivityFeed activityFeed = ActivityFeed(
            description:
                'A new survey ${result['title']} is available for you.',
            id: uuid.v4(),
            type: ActivityType.NEW_SURVEY_SCHEDULED,
            issuerID: result['id'],
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
  }
}
