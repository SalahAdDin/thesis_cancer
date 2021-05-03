// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UserSurveyResult _$_$_UserSurveyResultFromJson(Map<String, dynamic> json) {
  return _$_UserSurveyResult(
    id: json['id'] as String,
    userID: json['userID'] as String,
    surveyID: json['surveyID'] as String,
    answers: (json['answers'] as List<dynamic>)
        .map((e) => UserSurveyAnswer.fromJson(e as Map<String, dynamic>))
        .toList(),
    iteration: json['iteration'] as int,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
  );
}

Map<String, dynamic> _$_$_UserSurveyResultToJson(
        _$_UserSurveyResult instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userID': instance.userID,
      'surveyID': instance.surveyID,
      'answers': instance.answers,
      'iteration': instance.iteration,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
