// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'likes.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Like _$_$_LikeFromJson(Map<String, dynamic> json) {
  return _$_Like(
    id: json['id'] as String,
    postID: json['postID'] as String,
    userID: json['userID'] as String,
  );
}

Map<String, dynamic> _$_$_LikeToJson(_$_Like instance) => <String, dynamic>{
      'id': instance.id,
      'postID': instance.postID,
      'userID': instance.userID,
    };
