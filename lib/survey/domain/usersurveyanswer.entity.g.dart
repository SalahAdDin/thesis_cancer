// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usersurveyanswer.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSurveyAnswer _$_$_UserSurveyAnswerFromJson(Map<String, dynamic> json) {
  return _$_UserSurveyAnswer(
    id: json['id'] as String,
    userId: json['userId'] as String,
    surveyId: json['surveyId'] as String,
    answers: json['answers'] as Map<String, dynamic>,
    iteration: json['iteration'] as int,
  );
}

Map<String, dynamic> _$_$_UserSurveyAnswerToJson(
        _$_UserSurveyAnswer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'surveyId': instance.surveyId,
      'answers': instance.answers,
      'iteration': instance.iteration,
    };
