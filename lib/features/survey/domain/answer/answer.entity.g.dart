// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSurveyAnswer _$_$_UserSurveyAnswerFromJson(Map<String, dynamic> json) {
  return _$_UserSurveyAnswer(
    id: json['id'] as String,
    userSurveyResultID: json['userSurveyResultID'] as String,
    questionID: json['questionID'] as String,
    answer: json['answer'] as String,
  );
}

Map<String, dynamic> _$_$_UserSurveyAnswerToJson(
        _$_UserSurveyAnswer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userSurveyResultID': instance.userSurveyResultID,
      'questionID': instance.questionID,
      'answer': instance.answer,
    };
