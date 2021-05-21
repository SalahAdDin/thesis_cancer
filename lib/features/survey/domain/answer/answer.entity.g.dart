// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'answer.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSurveyAnswer _$_$_UserSurveyAnswerFromJson(Map<String, dynamic> json) {
  return _$_UserSurveyAnswer(
    id: json['id'] as String?,
    statement: json['statement'] as String,
    answer: json['answer'] as String,
  );
}

Map<String, dynamic> _$_$_UserSurveyAnswerToJson(
        _$_UserSurveyAnswer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statement': instance.statement,
      'answer': instance.answer,
    };
