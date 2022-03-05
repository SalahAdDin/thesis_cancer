import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';

part 'activityfeed.state.freezed.dart';

@freezed
class ActivityFeedState with _$ActivityFeedState {
  const factory ActivityFeedState.loading() = _Loading;

  const factory ActivityFeedState.data({
    required List<ActivityFeed> notifications,
  }) = _Data;

  const factory ActivityFeedState.completed() = _Completed;

  const factory ActivityFeedState.error([String? message]) = _Error;
}
