import 'package:thesis_cancer/user/domain/activityfeed.entity.dart';

abstract class ActivityFeedRepository {
  Future<List<ActivityFeed>> findAll();
  Future<List<ActivityFeed>> findByUserId(String id);
  Future<ActivityFeed> findById(String id);
  Future<ActivityFeed> createActivityFeed(ActivityFeed activityFeed);
  Future<void> removeActivityFeed(ActivityFeed activityFeed);
}
