import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.state.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';
import 'package:thesis_cancer/features/survey/infrastructure/survey.gql.dart';
import 'package:uuid/uuid.dart';

class ActivityFeedNotifier extends StateNotifier<ActivityFeedState> {
  ActivityFeedNotifier({})
      : super(const ActivityFeedState.loading()) {
    init();
  }

  GraphQLSubscriptionOperation? _subscriptionOnCreateSurveyOperation;
  GraphQLSubscriptionOperation? _subscriptionOnCreatePostOperation;
  GraphQLSubscriptionOperation? _subscriptionOnCreateCommentOperation;

  final List<ActivityFeed> _notifications = <ActivityFeed>[];

  Uuid uuid = const Uuid();

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
          final Map<String, dynamic> data =
              json.decode(event.data as String) as Map<String, dynamic>;
          final Map<String, dynamic> result =
              data['onCreateSurvey'] as Map<String, dynamic>;
          final ActivityFeed activityFeed = ActivityFeed(
            description:
                'A new survey ${result['title']} is available for you.',
            id: uuid.v4(),
            type: ActivityType.NEW_SURVEY_SCHEDULED,
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
  }
}
