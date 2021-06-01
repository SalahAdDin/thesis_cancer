import 'package:freezed_annotation/freezed_annotation.dart';

part 'schedules.entity.freezed.dart';
part 'schedules.entity.g.dart';

@freezed
class SurveySchedule with _$SurveySchedule {
  const factory SurveySchedule({
    required int iterations,
    required int step,
    required String survey, // Survey ID
    required String label,
  }) = _SurveySchedule;

  factory SurveySchedule.fromJson(Map<String, dynamic> json) =>
      _$SurveyScheduleFromJson(json);
}
