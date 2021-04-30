// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Survey _$_$_SurveyFromJson(Map<String, dynamic> json) {
  return _$_Survey(
    id: json['id'] as String,
    title: json['title'] as String,
    intro: json['intro'] as String?,
    questions: (json['questions'] as List<dynamic>?)
        ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_SurveyToJson(_$_Survey instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'intro': instance.intro,
      'questions': instance.questions,
    };
