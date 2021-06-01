// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'schedules.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SurveySchedule _$_$_SurveyScheduleFromJson(Map<String, dynamic> json) {
  return _$_SurveySchedule(
    iterations: json['iterations'] as int,
    step: json['step'] as int,
    survey: json['survey'] as String,
    label: json['label'] as String,
  );
}

Map<String, dynamic> _$_$_SurveyScheduleToJson(_$_SurveySchedule instance) =>
    <String, dynamic>{
      'iterations': instance.iterations,
      'step': instance.step,
      'survey': instance.survey,
      'label': instance.label,
    };
