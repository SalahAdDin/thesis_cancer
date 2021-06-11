import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';

/// Activity Feed Repository Interface
abstract class ActivityFeedRepository {
  /// Find all activity feeds.
  Future<List<ActivityFeed>> findAll();

  /// Find all activity feed by user id.
  Future<List<ActivityFeed>> findByUserId(String id);

  /// Find an activity feed by id.
  Future<ActivityFeed> findById(String id);

  /// Create an activity feed.
  Future<ActivityFeed> createActivityFeed(ActivityFeed activityFeed);

  /// Remove an activity feed.
  Future<void> removeActivityFeed(ActivityFeed activityFeed);
}
