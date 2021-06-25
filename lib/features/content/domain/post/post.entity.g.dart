// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Post _$_$_PostFromJson(Map<String, dynamic> json) {
  return _$_Post(
    id: json['id'] as String,
    type: _$enumDecode(_$PostTypeEnumMap, json['type']),
    description: json['description'] as String,
    gallery: (json['gallery'] as List<dynamic>)
        .map((e) => UploadFile.fromJson(e as Map<String, dynamic>))
        .toList(),
    author: json['author'] == null
        ? null
        : User.fromJson(json['author'] as Map<String, dynamic>),
    title: json['title'] as String?,
    createdAt: json['createdAt'] == null
        ? null
        : DateTime.parse(json['createdAt'] as String),
    comments: (json['comments'] as List<dynamic>?)
        ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
    likes: (json['likes'] as List<dynamic>?)
        ?.map((e) => Like.fromJson(e as Map<String, dynamic>))
        .toList(),
    likesCount: json['likesCount'] as int? ?? 0,
  );
}

Map<String, dynamic> _$_$_PostToJson(_$_Post instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'type': _$PostTypeEnumMap[instance.type],
    'description': instance.description,
    'gallery': instance.gallery.map((e) => e.toJson()).toList(),
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('author', instance.author?.toJson());
  writeNotNull('title', instance.title);
  writeNotNull('createdAt', instance.createdAt?.toIso8601String());
  writeNotNull('comments', instance.comments?.map((e) => e.toJson()).toList());
  writeNotNull('likes', instance.likes?.map((e) => e.toJson()).toList());
  val['likesCount'] = instance.likesCount;
  return val;
}

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

const _$PostTypeEnumMap = {
  PostType.INFORMATION: 'INFORMATION',
  PostType.TREATMENT: 'TREATMENT',
  PostType.ACADEMY: 'ACADEMY',
  PostType.SUCCESS_STORIES: 'SUCCESS_STORIES',
};
