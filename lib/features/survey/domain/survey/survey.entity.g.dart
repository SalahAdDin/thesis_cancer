// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Survey _$_$_SurveyFromJson(Map<String, dynamic> json) {
  return _$_Survey(
    id: json['id'] as String,
    title: json['title'] as String,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    intro: json['intro'] as String?,
    questions: (json['questions'] as List<dynamic>?)
        ?.map((e) => Question.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_SurveyToJson(_$_Survey instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'createdAt': instance.createdAt?.toIso8601String(),
      'intro': instance.intro,
      'questions': instance.questions?.map((e) => e.toJson()).toList(),
    };
