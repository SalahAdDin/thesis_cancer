// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploadfile.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UploadFile _$_$_UploadFileFromJson(Map<String, dynamic> json) {
  return _$_UploadFile(
    alternativeText: json['alternativeText'] as String,
    caption: json['caption'] as String,
    url: json['url'] as String,
    width: json['width'] as int,
    height: json['height'] as int,
  );
}

Map<String, dynamic> _$_$_UploadFileToJson(_$_UploadFile instance) =>
    <String, dynamic>{
      'alternativeText': instance.alternativeText,
      'caption': instance.caption,
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
    };
