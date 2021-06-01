// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSurveyResult _$_$_UserSurveyResultFromJson(Map<String, dynamic> json) {
  return _$_UserSurveyResult(
    user: json['user'] as String,
    survey: json['survey'] as String,
    answers: (json['answers'] as List<dynamic>)
        .map((e) => UserSurveyAnswer.fromJson(e as Map<String, dynamic>))
        .toList(),
    iteration: json['iteration'] as int,
  );
}

Map<String, dynamic> _$_$_UserSurveyResultToJson(
        _$_UserSurveyResult instance) =>
    <String, dynamic>{
      'user': instance.user,
      'survey': instance.survey,
      'answers': instance.answers.map((e) => e.toJson()).toList(),
      'iteration': instance.iteration,
    };
