import 'package:freezed_annotation/freezed_annotation.dart';

part 'extension.entity.freezed.dart';

part 'extension.entity.g.dart';

@freezed
class Message with _$Message {
  const factory Message({
    required String id,
    required String message,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);
}

@freezed
class Messages with _$Messages {
  const factory Messages({required List<Message> messages}) = _Messages;

  factory Messages.fromJson(Map<String, dynamic> json) =>
      _$MessagesFromJson(json);
}

@freezed
class Payload with _$Payload {
  const factory Payload({
    required int statusCode,
    required String error,
    required String message,
  }) = _Payload;

  factory Payload.fromJson(Map<String, dynamic> json) =>
      _$PayloadFromJson(json);
}

@freezed
class Output with _$Output {
  const factory Output({
    required int statusCode,
    required Payload payload,
    // required headers,
  }) = _Output;

  factory Output.fromJson(Map<String, dynamic> json) => _$OutputFromJson(json);
}

@freezed
class Data with _$Data {
  const factory Data({
    required int statusCode,
    required String error,
    required List<Messages> data,
  }) = _Data;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}

@freezed
class Exception with _$Exception {
  @Assert(
    "data != null || output != null",
    "Either one of them must be not null.",
  )
  const factory Exception({
    int? code,
    Data? data,
    Output? output,
    required List<String> stacktrace,
  }) = _Exception;

  factory Exception.fromJson(Map<String, dynamic> json) =>
      _$ExceptionFromJson(json);
}

@freezed
class Extension with _$Extension {
  const factory Extension({
    required String code,
    required Exception exception,
  }) = _Extension;

  const Extension._();

  factory Extension.fromJson(Map<String, dynamic> json) =>
      _$ExtensionFromJson(json);

  /// As far we understood from Strapi, which uses [Boom](https://hapi.dev/module/boom/api/?v=9.1.2) to handle errors,
  /// listed here in [Koa](https://koajs.com/#response):
  /// - Data will be always in formatted messages(almost everyone in Auth).
  /// - Output will be always in other cases.

  Data? get data => exception.data;

  Output? get output => exception.output;

  int? get statusCode =>
      exception.data?.statusCode ?? exception.output?.statusCode;

  String? get error => exception.data?.error ?? exception.output?.payload.error;

  Message? get dataMessage => exception.data?.data[0].messages[0];

  String? get outputMessage => exception.output?.payload.message;

  List<String> get stackTrace => exception.stacktrace;
}
