// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Settings _$_$_SettingsFromJson(Map<String, dynamic> json) {
  return _$_Settings(
    introductoryVideo: json['introductoryVideo'] == null
        ? null
        : UploadFile.fromJson(
            json['introductoryVideo'] as Map<String, dynamic>),
    registeringSurvey: json['registeringSurvey'] as String?,
    surveySchedules: (json['surveySchedules'] as List<dynamic>?)
        ?.map((e) => SurveySchedule.fromJson(e as Map<String, dynamic>))
        .toList(),
    darkTheme: json['darkTheme'] as bool? ?? false,
  );
}

Map<String, dynamic> _$_$_SettingsToJson(_$_Settings instance) =>
    <String, dynamic>{
      'introductoryVideo': instance.introductoryVideo?.toJson(),
      'registeringSurvey': instance.registeringSurvey,
      'surveySchedules':
          instance.surveySchedules?.map((e) => e.toJson()).toList(),
      'darkTheme': instance.darkTheme,
    };
