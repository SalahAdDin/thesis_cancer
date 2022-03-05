import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/domain/types.dart';

part 'schedules.entity.freezed.dart';
part 'schedules.entity.g.dart';

/// Survey Schedule Entity
@freezed
class SurveySchedule with _$SurveySchedule {
  /// Default builder.
  const factory SurveySchedule({
    required RoleOptions role,
    required int iterations,
    required int step, // Amount of weeks between each iteration.
    required String survey, // Survey ID
    required String label,
  }) = _SurveySchedule;

  /// Builds a [SurveySchedule] from a given json [String].
  factory SurveySchedule.fromJson(Map<String, Object?> json) =>
      _$SurveyScheduleFromJson(json);
}
