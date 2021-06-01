// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$_$_PostFromJson(Map<String, dynamic> json) {
  return _$_Post(
    id: json['id'] as String,
    type: _$enumDecode(_$ContentTypeEnumMap, json['type']),
    content: json['content'] as String,
    userID: json['userID'] as String,
    media: (json['media'] as List<dynamic>)
        .map((e) => UploadFile.fromJson(e as Map<String, dynamic>))
        .toList(),
    comments: (json['comments'] as List<dynamic>?)
        ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
    likes: (json['likes'] as List<dynamic>?)
        ?.map((e) => Like.fromJson(e as Map<String, dynamic>))
        .toList(),
    likesCount: json['likesCount'] as int? ?? 0,
  );
}

Map<String, dynamic> _$_$_PostToJson(_$_Post instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$ContentTypeEnumMap[instance.type],
      'content': instance.content,
      'userID': instance.userID,
      'media': instance.media.map((e) => e.toJson()).toList(),
      'comments': instance.comments?.map((e) => e.toJson()).toList(),
      'likes': instance.likes?.map((e) => e.toJson()).toList(),
      'likesCount': instance.likesCount,
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

const _$ContentTypeEnumMap = {
  ContentType.INFORMATION: 'INFORMATION',
  ContentType.TREATMENT: 'TREATMENT',
  ContentType.ACADEMY: 'ACADEMY',
  ContentType.SUCCESS_STORIES: 'SUCCESS_STORIES',
};
