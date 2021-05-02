// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSurveyResult _$_$_UserSurveyResultFromJson(Map<String, dynamic> json) {
  return _$_UserSurveyResult(
    id: json['id'] as String,
    userId: json['userId'] as String,
    surveyId: json['surveyId'] as String,
    answers: (json['answers'] as List<dynamic>?)
        ?.map((e) => UserSurveyAnswer.fromJson(e as Map<String, dynamic>))
        .toList(),
    iteration: json['iteration'] as int,
  );
}

Map<String, dynamic> _$_$_UserSurveyResultToJson(
        _$_UserSurveyResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'surveyId': instance.surveyId,
      'answers': instance.answers,
      'iteration': instance.iteration,
    };
