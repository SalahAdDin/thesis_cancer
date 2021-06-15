// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'uploadfile.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_UploadFile _$_$_UploadFileFromJson(Map<String, dynamic> json) {
  return _$_UploadFile(
    id: json['id'] as String?,
    alternativeText: json['alternativeText'] as String,
    caption: json['caption'] as String,
    url: json['url'] as String,
    width: json['width'] as int?,
    height: json['height'] as int?,
    mime: json['mime'] as String?,
  );
}

Map<String, dynamic> _$_$_UploadFileToJson(_$_UploadFile instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['alternativeText'] = instance.alternativeText;
  val['caption'] = instance.caption;
  val['url'] = instance.url;
  writeNotNull('width', instance.width);
  writeNotNull('height', instance.height);
  writeNotNull('mime', instance.mime);
  return val;
}
