import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedules.entity.freezed.dart';

part 'schedules.entity.g.dart';

/// Survey Schedule Entity
@freezed
class SurveySchedule with _$SurveySchedule {
  /// Default builder.
  const factory SurveySchedule({
    required int iterations,

    /// Amount of weeks between each iteration.
    required int step,
    required String survey, // Survey ID
    required String label,
  }) = _SurveySchedule;

  /// Builds a [SurveySchedule] from a given json [String].
  factory SurveySchedule.fromJson(Map<String, Object?> json) =>
      _$SurveyScheduleFromJson(json);
}
