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
    @Default(<String, Object>{}) Map<String, Object>? data,
    required String body,
    required String title,
    @Default(false) bool isRead,
  }) = _ActivityFeed;

  const ActivityFeed._();

  /// Builds an [ActivityFeed] from a given [String] payload.
  factory ActivityFeed.fromPayload({required String payload}) {
    final Map<String, dynamic> data =
        jsonDecode(payload) as Map<String, Object?>;
    final ActivityFeed result = ActivityFeed.fromJson(data);
    return result;
  }

  /// Builds an [ActivityFeed] from a given json [String].
  factory ActivityFeed.fromJson(Map<String, Object?> json) =>
      _$ActivityFeedFromJson(json);

  /// Builds a empty(dummy) [ActivityFeed].
  static const ActivityFeed empty = ActivityFeed(
    type: ActivityType.NEW_POST,
    body: 'New dummy feed',
    title: 'Dummy Feed',
  );
}
