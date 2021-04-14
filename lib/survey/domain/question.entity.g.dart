// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'question.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Question _$_$_QuestionFromJson(Map<String, dynamic> json) {
  return _$_Question(
    id: json['id'] as String,
    statement: json['statement'] as String,
    type: _$enumDecode(_$QuestionTypeEnumMap, json['type']),
    answer: json['answer'] as String?,
    surveyID: json['surveyID'] as String,
  );
}

Map<String, dynamic> _$_$_QuestionToJson(_$_Question instance) =>
    <String, dynamic>{
      'id': instance.id,
      'statement': instance.statement,
      'type': _$QuestionTypeEnumMap[instance.type],
      'answer': instance.answer,
      'surveyID': instance.surveyID,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$QuestionTypeEnumMap = {
  QuestionType.BOOL: 'BOOL',
  QuestionType.MULTIPLE: 'MULTIPLE',
  QuestionType.OPEN: 'OPEN',
  QuestionType.SINGLE: 'SINGLE',
};
