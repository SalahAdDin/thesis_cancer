import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/domain/types.dart';

part 'activityfeed.entity.freezed.dart';
part 'activityfeed.entity.g.dart';

@freezed
class ActivityFeed with _$ActivityFeed {
  const factory ActivityFeed({
    required String id,
    required ActivityType type,
    required String issuerID,
    required String description,
  }) = _ActivityFeed;

  factory ActivityFeed.fromJson(Map<String, dynamic> json) =>
      _$ActivityFeedFromJson(json);
  static const empty = ActivityFeed(
      id: '', type: ActivityType.NEW_POST, issuerID: '', description: '');
}
