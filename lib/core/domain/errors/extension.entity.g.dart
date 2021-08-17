// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extension.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Message _$_$_MessageFromJson(Map<String, dynamic> json) {
  return _$_Message(
    id: json['id'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$_$_MessageToJson(_$_Message instance) =>
    <String, dynamic>{
      'id': instance.id,
      'message': instance.message,
    };

_$_Messages _$_$_MessagesFromJson(Map<String, dynamic> json) {
  return _$_Messages(
    messages: (json['messages'] as List<dynamic>)
        .map((e) => Message.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_MessagesToJson(_$_Messages instance) =>
    <String, dynamic>{
      'messages': instance.messages.map((e) => e.toJson()).toList(),
    };

_$_Payload _$_$_PayloadFromJson(Map<String, dynamic> json) {
  return _$_Payload(
    statusCode: json['statusCode'] as int,
    error: json['error'] as String,
    message: json['message'] as String,
  );
}

Map<String, dynamic> _$_$_PayloadToJson(_$_Payload instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'error': instance.error,
      'message': instance.message,
    };

_$_Output _$_$_OutputFromJson(Map<String, dynamic> json) {
  return _$_Output(
    statusCode: json['statusCode'] as int,
    payload: Payload.fromJson(json['payload'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_OutputToJson(_$_Output instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'payload': instance.payload.toJson(),
    };

_$_Data _$_$_DataFromJson(Map<String, dynamic> json) {
  return _$_Data(
    statusCode: json['statusCode'] as int,
    error: json['error'] as String,
    data: (json['data'] as List<dynamic>)
        .map((e) => Messages.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_DataToJson(_$_Data instance) => <String, dynamic>{
      'statusCode': instance.statusCode,
      'error': instance.error,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$_Exception _$_$_ExceptionFromJson(Map<String, dynamic> json) {
  return _$_Exception(
    code: json['code'] as int?,
    data: json['data'] == null
        ? null
        : Data.fromJson(json['data'] as Map<String, dynamic>),
    output: json['output'] == null
        ? null
        : Output.fromJson(json['output'] as Map<String, dynamic>),
    stacktrace:
        (json['stacktrace'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$_$_ExceptionToJson(_$_Exception instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('data', instance.data?.toJson());
  writeNotNull('output', instance.output?.toJson());
  val['stacktrace'] = instance.stacktrace;
  return val;
}

_$_Extension _$_$_ExtensionFromJson(Map<String, dynamic> json) {
  return _$_Extension(
    code: json['code'] as String,
    exception: Exception.fromJson(json['exception'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$_$_ExtensionToJson(_$_Extension instance) =>
    <String, dynamic>{
      'code': instance.code,
      'exception': instance.exception.toJson(),
    };
