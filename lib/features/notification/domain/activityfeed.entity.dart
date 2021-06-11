import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/domain/types.dart';

part 'activityfeed.entity.freezed.dart';
part 'activityfeed.entity.g.dart';

/// Activity Feed (notification) Entity
@freezed
class ActivityFeed with _$ActivityFeed {
  /// Default constructor
  const factory ActivityFeed({
    String? id,
    required ActivityType type,
    required String issuerID,
    required String description,
  }) = _ActivityFeed;

  const ActivityFeed._();

  /// Builds an [ActivityFeed] from a given [String] payload.
  factory ActivityFeed.fromPayload({required String payload}) {
    final Map<String, dynamic> data =
        jsonDecode(payload) as Map<String, dynamic>;
    final ActivityFeed result = ActivityFeed.fromJson(data);
    return result;
  }

  /// Builds an [ActivityFeed] from a given json [String].
  factory ActivityFeed.fromJson(Map<String, dynamic> json) =>
      _$ActivityFeedFromJson(json);
  static const ActivityFeed empty =
      ActivityFeed(type: ActivityType.NEW_POST, issuerID: '', description: '');

  /// Get a title for an [ActivityFeed] from its [ActivityType] type.
  String get title {
    switch (type) {
      case ActivityType.NEW_COMMENT:
        return "New comment";
      case ActivityType.NEW_FOLLOW:
        return "New follower";
      case ActivityType.NEW_LIKE:
        return "New like on Post";
      case ActivityType.NEW_POST:
        return "New post";
      case ActivityType.NEW_SURVEY_SCHEDULED:
        return "Scheduled survey";
      case ActivityType.NEW_RECOMMENDATION:
        return "New recommendation";
    }
  }
}
