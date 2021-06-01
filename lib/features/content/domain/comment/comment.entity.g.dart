// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Comment _$_$_CommentFromJson(Map<String, dynamic> json) {
  return _$_Comment(
    id: json['id'] as String,
    postID: json['postID'] as String,
    userID: json['userID'] as String,
    content: json['content'] as String,
  );
}

Map<String, dynamic> _$_$_CommentToJson(_$_Comment instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postID': instance.postID,
      'userID': instance.userID,
      'content': instance.content,
    };
