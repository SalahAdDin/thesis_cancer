// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploadfile.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UploadFile _$_$_UploadFileFromJson(Map<String, dynamic> json) {
  return _$_UploadFile(
    id: json['id'] as String,
    url: json['url'] as String,
    description: json['description'] as String?,
    postID: json['postID'] as String?,
    userID: json['userID'] as String?,
  );
}

Map<String, dynamic> _$_$_UploadFileToJson(_$_UploadFile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'description': instance.description,
      'postID': instance.postID,
      'userID': instance.userID,
    };
