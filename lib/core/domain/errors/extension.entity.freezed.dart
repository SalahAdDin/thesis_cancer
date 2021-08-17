// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'extension.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
class _$MessageTearOff {
  const _$MessageTearOff();

  _Message call({required String id, required String message}) {
    return _Message(
      id: id,
      message: message,
    );
  }

  Message fromJson(Map<String, Object> json) {
    return Message.fromJson(json);
  }
}

/// @nodoc
const $Message = _$MessageTearOff();

/// @nodoc
mixin _$Message {
  String get id => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res>;
  $Res call({String id, String message});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  final Message _value;
  // ignore: unused_field
  final $Res Function(Message) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) then) =
      __$MessageCopyWithImpl<$Res>;
  @override
  $Res call({String id, String message});
}

/// @nodoc
class __$MessageCopyWithImpl<$Res> extends _$MessageCopyWithImpl<$Res>
    implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(_Message _value, $Res Function(_Message) _then)
      : super(_value, (v) => _then(v as _Message));

  @override
  _Message get _value => super._value as _Message;

  @override
  $Res call({
    Object? id = freezed,
    Object? message = freezed,
  }) {
    return _then(_Message(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Message implements _Message {
  const _$_Message({required this.id, required this.message});

  factory _$_Message.fromJson(Map<String, dynamic> json) =>
      _$_$_MessageFromJson(json);

  @override
  final String id;
  @override
  final String message;

  @override
  String toString() {
    return 'Message(id: $id, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Message &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$MessageCopyWith<_Message> get copyWith =>
      __$MessageCopyWithImpl<_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MessageToJson(this);
  }
}

abstract class _Message implements Message {
  const factory _Message({required String id, required String message}) =
      _$_Message;

  factory _Message.fromJson(Map<String, dynamic> json) = _$_Message.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MessageCopyWith<_Message> get copyWith =>
      throw _privateConstructorUsedError;
}

Messages _$MessagesFromJson(Map<String, dynamic> json) {
  return _Messages.fromJson(json);
}

/// @nodoc
class _$MessagesTearOff {
  const _$MessagesTearOff();

  _Messages call({required List<Message> messages}) {
    return _Messages(
      messages: messages,
    );
  }

  Messages fromJson(Map<String, Object> json) {
    return Messages.fromJson(json);
  }
}

/// @nodoc
const $Messages = _$MessagesTearOff();

/// @nodoc
mixin _$Messages {
  List<Message> get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessagesCopyWith<Messages> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessagesCopyWith<$Res> {
  factory $MessagesCopyWith(Messages value, $Res Function(Messages) then) =
      _$MessagesCopyWithImpl<$Res>;
  $Res call({List<Message> messages});
}

/// @nodoc
class _$MessagesCopyWithImpl<$Res> implements $MessagesCopyWith<$Res> {
  _$MessagesCopyWithImpl(this._value, this._then);

  final Messages _value;
  // ignore: unused_field
  final $Res Function(Messages) _then;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
abstract class _$MessagesCopyWith<$Res> implements $MessagesCopyWith<$Res> {
  factory _$MessagesCopyWith(_Messages value, $Res Function(_Messages) then) =
      __$MessagesCopyWithImpl<$Res>;
  @override
  $Res call({List<Message> messages});
}

/// @nodoc
class __$MessagesCopyWithImpl<$Res> extends _$MessagesCopyWithImpl<$Res>
    implements _$MessagesCopyWith<$Res> {
  __$MessagesCopyWithImpl(_Messages _value, $Res Function(_Messages) _then)
      : super(_value, (v) => _then(v as _Messages));

  @override
  _Messages get _value => super._value as _Messages;

  @override
  $Res call({
    Object? messages = freezed,
  }) {
    return _then(_Messages(
      messages: messages == freezed
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Messages implements _Messages {
  const _$_Messages({required this.messages});

  factory _$_Messages.fromJson(Map<String, dynamic> json) =>
      _$_$_MessagesFromJson(json);

  @override
  final List<Message> messages;

  @override
  String toString() {
    return 'Messages(messages: $messages)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Messages &&
            (identical(other.messages, messages) ||
                const DeepCollectionEquality()
                    .equals(other.messages, messages)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(messages);

  @JsonKey(ignore: true)
  @override
  _$MessagesCopyWith<_Messages> get copyWith =>
      __$MessagesCopyWithImpl<_Messages>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_MessagesToJson(this);
  }
}

abstract class _Messages implements Messages {
  const factory _Messages({required List<Message> messages}) = _$_Messages;

  factory _Messages.fromJson(Map<String, dynamic> json) = _$_Messages.fromJson;

  @override
  List<Message> get messages => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$MessagesCopyWith<_Messages> get copyWith =>
      throw _privateConstructorUsedError;
}

Payload _$PayloadFromJson(Map<String, dynamic> json) {
  return _Payload.fromJson(json);
}

/// @nodoc
class _$PayloadTearOff {
  const _$PayloadTearOff();

  _Payload call(
      {required int statusCode,
      required String error,
      required String message}) {
    return _Payload(
      statusCode: statusCode,
      error: error,
      message: message,
    );
  }

  Payload fromJson(Map<String, Object> json) {
    return Payload.fromJson(json);
  }
}

/// @nodoc
const $Payload = _$PayloadTearOff();

/// @nodoc
mixin _$Payload {
  int get statusCode => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PayloadCopyWith<Payload> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayloadCopyWith<$Res> {
  factory $PayloadCopyWith(Payload value, $Res Function(Payload) then) =
      _$PayloadCopyWithImpl<$Res>;
  $Res call({int statusCode, String error, String message});
}

/// @nodoc
class _$PayloadCopyWithImpl<$Res> implements $PayloadCopyWith<$Res> {
  _$PayloadCopyWithImpl(this._value, this._then);

  final Payload _value;
  // ignore: unused_field
  final $Res Function(Payload) _then;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$PayloadCopyWith<$Res> implements $PayloadCopyWith<$Res> {
  factory _$PayloadCopyWith(_Payload value, $Res Function(_Payload) then) =
      __$PayloadCopyWithImpl<$Res>;
  @override
  $Res call({int statusCode, String error, String message});
}

/// @nodoc
class __$PayloadCopyWithImpl<$Res> extends _$PayloadCopyWithImpl<$Res>
    implements _$PayloadCopyWith<$Res> {
  __$PayloadCopyWithImpl(_Payload _value, $Res Function(_Payload) _then)
      : super(_value, (v) => _then(v as _Payload));

  @override
  _Payload get _value => super._value as _Payload;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? error = freezed,
    Object? message = freezed,
  }) {
    return _then(_Payload(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      message: message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Payload implements _Payload {
  const _$_Payload(
      {required this.statusCode, required this.error, required this.message});

  factory _$_Payload.fromJson(Map<String, dynamic> json) =>
      _$_$_PayloadFromJson(json);

  @override
  final int statusCode;
  @override
  final String error;
  @override
  final String message;

  @override
  String toString() {
    return 'Payload(statusCode: $statusCode, error: $error, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Payload &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(message);

  @JsonKey(ignore: true)
  @override
  _$PayloadCopyWith<_Payload> get copyWith =>
      __$PayloadCopyWithImpl<_Payload>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PayloadToJson(this);
  }
}

abstract class _Payload implements Payload {
  const factory _Payload(
      {required int statusCode,
      required String error,
      required String message}) = _$_Payload;

  factory _Payload.fromJson(Map<String, dynamic> json) = _$_Payload.fromJson;

  @override
  int get statusCode => throw _privateConstructorUsedError;
  @override
  String get error => throw _privateConstructorUsedError;
  @override
  String get message => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PayloadCopyWith<_Payload> get copyWith =>
      throw _privateConstructorUsedError;
}

Output _$OutputFromJson(Map<String, dynamic> json) {
  return _Output.fromJson(json);
}

/// @nodoc
class _$OutputTearOff {
  const _$OutputTearOff();

  _Output call({required int statusCode, required Payload payload}) {
    return _Output(
      statusCode: statusCode,
      payload: payload,
    );
  }

  Output fromJson(Map<String, Object> json) {
    return Output.fromJson(json);
  }
}

/// @nodoc
const $Output = _$OutputTearOff();

/// @nodoc
mixin _$Output {
  int get statusCode => throw _privateConstructorUsedError;
  Payload get payload => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OutputCopyWith<Output> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OutputCopyWith<$Res> {
  factory $OutputCopyWith(Output value, $Res Function(Output) then) =
      _$OutputCopyWithImpl<$Res>;
  $Res call({int statusCode, Payload payload});

  $PayloadCopyWith<$Res> get payload;
}

/// @nodoc
class _$OutputCopyWithImpl<$Res> implements $OutputCopyWith<$Res> {
  _$OutputCopyWithImpl(this._value, this._then);

  final Output _value;
  // ignore: unused_field
  final $Res Function(Output) _then;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? payload = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Payload,
    ));
  }

  @override
  $PayloadCopyWith<$Res> get payload {
    return $PayloadCopyWith<$Res>(_value.payload, (value) {
      return _then(_value.copyWith(payload: value));
    });
  }
}

/// @nodoc
abstract class _$OutputCopyWith<$Res> implements $OutputCopyWith<$Res> {
  factory _$OutputCopyWith(_Output value, $Res Function(_Output) then) =
      __$OutputCopyWithImpl<$Res>;
  @override
  $Res call({int statusCode, Payload payload});

  @override
  $PayloadCopyWith<$Res> get payload;
}

/// @nodoc
class __$OutputCopyWithImpl<$Res> extends _$OutputCopyWithImpl<$Res>
    implements _$OutputCopyWith<$Res> {
  __$OutputCopyWithImpl(_Output _value, $Res Function(_Output) _then)
      : super(_value, (v) => _then(v as _Output));

  @override
  _Output get _value => super._value as _Output;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? payload = freezed,
  }) {
    return _then(_Output(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      payload: payload == freezed
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Payload,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Output implements _Output {
  const _$_Output({required this.statusCode, required this.payload});

  factory _$_Output.fromJson(Map<String, dynamic> json) =>
      _$_$_OutputFromJson(json);

  @override
  final int statusCode;
  @override
  final Payload payload;

  @override
  String toString() {
    return 'Output(statusCode: $statusCode, payload: $payload)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Output &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.payload, payload) ||
                const DeepCollectionEquality().equals(other.payload, payload)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(payload);

  @JsonKey(ignore: true)
  @override
  _$OutputCopyWith<_Output> get copyWith =>
      __$OutputCopyWithImpl<_Output>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_OutputToJson(this);
  }
}

abstract class _Output implements Output {
  const factory _Output({required int statusCode, required Payload payload}) =
      _$_Output;

  factory _Output.fromJson(Map<String, dynamic> json) = _$_Output.fromJson;

  @override
  int get statusCode => throw _privateConstructorUsedError;
  @override
  Payload get payload => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$OutputCopyWith<_Output> get copyWith => throw _privateConstructorUsedError;
}

Data _$DataFromJson(Map<String, dynamic> json) {
  return _Data.fromJson(json);
}

/// @nodoc
class _$DataTearOff {
  const _$DataTearOff();

  _Data call(
      {required int statusCode,
      required String error,
      required List<Messages> data}) {
    return _Data(
      statusCode: statusCode,
      error: error,
      data: data,
    );
  }

  Data fromJson(Map<String, Object> json) {
    return Data.fromJson(json);
  }
}

/// @nodoc
const $Data = _$DataTearOff();

/// @nodoc
mixin _$Data {
  int get statusCode => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;
  List<Messages> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DataCopyWith<Data> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DataCopyWith<$Res> {
  factory $DataCopyWith(Data value, $Res Function(Data) then) =
      _$DataCopyWithImpl<$Res>;
  $Res call({int statusCode, String error, List<Messages> data});
}

/// @nodoc
class _$DataCopyWithImpl<$Res> implements $DataCopyWith<$Res> {
  _$DataCopyWithImpl(this._value, this._then);

  final Data _value;
  // ignore: unused_field
  final $Res Function(Data) _then;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? error = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Messages>,
    ));
  }
}

/// @nodoc
abstract class _$DataCopyWith<$Res> implements $DataCopyWith<$Res> {
  factory _$DataCopyWith(_Data value, $Res Function(_Data) then) =
      __$DataCopyWithImpl<$Res>;
  @override
  $Res call({int statusCode, String error, List<Messages> data});
}

/// @nodoc
class __$DataCopyWithImpl<$Res> extends _$DataCopyWithImpl<$Res>
    implements _$DataCopyWith<$Res> {
  __$DataCopyWithImpl(_Data _value, $Res Function(_Data) _then)
      : super(_value, (v) => _then(v as _Data));

  @override
  _Data get _value => super._value as _Data;

  @override
  $Res call({
    Object? statusCode = freezed,
    Object? error = freezed,
    Object? data = freezed,
  }) {
    return _then(_Data(
      statusCode: statusCode == freezed
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Messages>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Data implements _Data {
  const _$_Data(
      {required this.statusCode, required this.error, required this.data});

  factory _$_Data.fromJson(Map<String, dynamic> json) =>
      _$_$_DataFromJson(json);

  @override
  final int statusCode;
  @override
  final String error;
  @override
  final List<Messages> data;

  @override
  String toString() {
    return 'Data(statusCode: $statusCode, error: $error, data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Data &&
            (identical(other.statusCode, statusCode) ||
                const DeepCollectionEquality()
                    .equals(other.statusCode, statusCode)) &&
            (identical(other.error, error) ||
                const DeepCollectionEquality().equals(other.error, error)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(statusCode) ^
      const DeepCollectionEquality().hash(error) ^
      const DeepCollectionEquality().hash(data);

  @JsonKey(ignore: true)
  @override
  _$DataCopyWith<_Data> get copyWith =>
      __$DataCopyWithImpl<_Data>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_DataToJson(this);
  }
}

abstract class _Data implements Data {
  const factory _Data(
      {required int statusCode,
      required String error,
      required List<Messages> data}) = _$_Data;

  factory _Data.fromJson(Map<String, dynamic> json) = _$_Data.fromJson;

  @override
  int get statusCode => throw _privateConstructorUsedError;
  @override
  String get error => throw _privateConstructorUsedError;
  @override
  List<Messages> get data => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$DataCopyWith<_Data> get copyWith => throw _privateConstructorUsedError;
}

Exception _$ExceptionFromJson(Map<String, dynamic> json) {
  return _Exception.fromJson(json);
}

/// @nodoc
class _$ExceptionTearOff {
  const _$ExceptionTearOff();

  _Exception call(
      {int? code,
      Data? data,
      Output? output,
      required List<String> stacktrace}) {
    return _Exception(
      code: code,
      data: data,
      output: output,
      stacktrace: stacktrace,
    );
  }

  Exception fromJson(Map<String, Object> json) {
    return Exception.fromJson(json);
  }
}

/// @nodoc
const $Exception = _$ExceptionTearOff();

/// @nodoc
mixin _$Exception {
  int? get code => throw _privateConstructorUsedError;
  Data? get data => throw _privateConstructorUsedError;
  Output? get output => throw _privateConstructorUsedError;
  List<String> get stacktrace => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExceptionCopyWith<Exception> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExceptionCopyWith<$Res> {
  factory $ExceptionCopyWith(Exception value, $Res Function(Exception) then) =
      _$ExceptionCopyWithImpl<$Res>;
  $Res call({int? code, Data? data, Output? output, List<String> stacktrace});

  $DataCopyWith<$Res>? get data;
  $OutputCopyWith<$Res>? get output;
}

/// @nodoc
class _$ExceptionCopyWithImpl<$Res> implements $ExceptionCopyWith<$Res> {
  _$ExceptionCopyWithImpl(this._value, this._then);

  final Exception _value;
  // ignore: unused_field
  final $Res Function(Exception) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? data = freezed,
    Object? output = freezed,
    Object? stacktrace = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      output: output == freezed
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as Output?,
      stacktrace: stacktrace == freezed
          ? _value.stacktrace
          : stacktrace // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }

  @override
  $DataCopyWith<$Res>? get data {
    if (_value.data == null) {
      return null;
    }

    return $DataCopyWith<$Res>(_value.data!, (value) {
      return _then(_value.copyWith(data: value));
    });
  }

  @override
  $OutputCopyWith<$Res>? get output {
    if (_value.output == null) {
      return null;
    }

    return $OutputCopyWith<$Res>(_value.output!, (value) {
      return _then(_value.copyWith(output: value));
    });
  }
}

/// @nodoc
abstract class _$ExceptionCopyWith<$Res> implements $ExceptionCopyWith<$Res> {
  factory _$ExceptionCopyWith(
          _Exception value, $Res Function(_Exception) then) =
      __$ExceptionCopyWithImpl<$Res>;
  @override
  $Res call({int? code, Data? data, Output? output, List<String> stacktrace});

  @override
  $DataCopyWith<$Res>? get data;
  @override
  $OutputCopyWith<$Res>? get output;
}

/// @nodoc
class __$ExceptionCopyWithImpl<$Res> extends _$ExceptionCopyWithImpl<$Res>
    implements _$ExceptionCopyWith<$Res> {
  __$ExceptionCopyWithImpl(_Exception _value, $Res Function(_Exception) _then)
      : super(_value, (v) => _then(v as _Exception));

  @override
  _Exception get _value => super._value as _Exception;

  @override
  $Res call({
    Object? code = freezed,
    Object? data = freezed,
    Object? output = freezed,
    Object? stacktrace = freezed,
  }) {
    return _then(_Exception(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as int?,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as Data?,
      output: output == freezed
          ? _value.output
          : output // ignore: cast_nullable_to_non_nullable
              as Output?,
      stacktrace: stacktrace == freezed
          ? _value.stacktrace
          : stacktrace // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Exception implements _Exception {
  const _$_Exception(
      {this.code, this.data, this.output, required this.stacktrace})
      : assert(data != null || output != null,
            'Either one of them must be not null.');

  factory _$_Exception.fromJson(Map<String, dynamic> json) =>
      _$_$_ExceptionFromJson(json);

  @override
  final int? code;
  @override
  final Data? data;
  @override
  final Output? output;
  @override
  final List<String> stacktrace;

  @override
  String toString() {
    return 'Exception(code: $code, data: $data, output: $output, stacktrace: $stacktrace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Exception &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.data, data) ||
                const DeepCollectionEquality().equals(other.data, data)) &&
            (identical(other.output, output) ||
                const DeepCollectionEquality().equals(other.output, output)) &&
            (identical(other.stacktrace, stacktrace) ||
                const DeepCollectionEquality()
                    .equals(other.stacktrace, stacktrace)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(data) ^
      const DeepCollectionEquality().hash(output) ^
      const DeepCollectionEquality().hash(stacktrace);

  @JsonKey(ignore: true)
  @override
  _$ExceptionCopyWith<_Exception> get copyWith =>
      __$ExceptionCopyWithImpl<_Exception>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ExceptionToJson(this);
  }
}

abstract class _Exception implements Exception {
  const factory _Exception(
      {int? code,
      Data? data,
      Output? output,
      required List<String> stacktrace}) = _$_Exception;

  factory _Exception.fromJson(Map<String, dynamic> json) =
      _$_Exception.fromJson;

  @override
  int? get code => throw _privateConstructorUsedError;
  @override
  Data? get data => throw _privateConstructorUsedError;
  @override
  Output? get output => throw _privateConstructorUsedError;
  @override
  List<String> get stacktrace => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ExceptionCopyWith<_Exception> get copyWith =>
      throw _privateConstructorUsedError;
}

Extension _$ExtensionFromJson(Map<String, dynamic> json) {
  return _Extension.fromJson(json);
}

/// @nodoc
class _$ExtensionTearOff {
  const _$ExtensionTearOff();

  _Extension call({required String code, required Exception exception}) {
    return _Extension(
      code: code,
      exception: exception,
    );
  }

  Extension fromJson(Map<String, Object> json) {
    return Extension.fromJson(json);
  }
}

/// @nodoc
const $Extension = _$ExtensionTearOff();

/// @nodoc
mixin _$Extension {
  String get code => throw _privateConstructorUsedError;
  Exception get exception => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExtensionCopyWith<Extension> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExtensionCopyWith<$Res> {
  factory $ExtensionCopyWith(Extension value, $Res Function(Extension) then) =
      _$ExtensionCopyWithImpl<$Res>;
  $Res call({String code, Exception exception});

  $ExceptionCopyWith<$Res> get exception;
}

/// @nodoc
class _$ExtensionCopyWithImpl<$Res> implements $ExtensionCopyWith<$Res> {
  _$ExtensionCopyWithImpl(this._value, this._then);

  final Extension _value;
  // ignore: unused_field
  final $Res Function(Extension) _then;

  @override
  $Res call({
    Object? code = freezed,
    Object? exception = freezed,
  }) {
    return _then(_value.copyWith(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }

  @override
  $ExceptionCopyWith<$Res> get exception {
    return $ExceptionCopyWith<$Res>(_value.exception, (value) {
      return _then(_value.copyWith(exception: value));
    });
  }
}

/// @nodoc
abstract class _$ExtensionCopyWith<$Res> implements $ExtensionCopyWith<$Res> {
  factory _$ExtensionCopyWith(
          _Extension value, $Res Function(_Extension) then) =
      __$ExtensionCopyWithImpl<$Res>;
  @override
  $Res call({String code, Exception exception});

  @override
  $ExceptionCopyWith<$Res> get exception;
}

/// @nodoc
class __$ExtensionCopyWithImpl<$Res> extends _$ExtensionCopyWithImpl<$Res>
    implements _$ExtensionCopyWith<$Res> {
  __$ExtensionCopyWithImpl(_Extension _value, $Res Function(_Extension) _then)
      : super(_value, (v) => _then(v as _Extension));

  @override
  _Extension get _value => super._value as _Extension;

  @override
  $Res call({
    Object? code = freezed,
    Object? exception = freezed,
  }) {
    return _then(_Extension(
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as Exception,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Extension extends _Extension {
  const _$_Extension({required this.code, required this.exception}) : super._();

  factory _$_Extension.fromJson(Map<String, dynamic> json) =>
      _$_$_ExtensionFromJson(json);

  @override
  final String code;
  @override
  final Exception exception;

  @override
  String toString() {
    return 'Extension(code: $code, exception: $exception)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Extension &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.exception, exception) ||
                const DeepCollectionEquality()
                    .equals(other.exception, exception)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(exception);

  @JsonKey(ignore: true)
  @override
  _$ExtensionCopyWith<_Extension> get copyWith =>
      __$ExtensionCopyWithImpl<_Extension>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ExtensionToJson(this);
  }
}

abstract class _Extension extends Extension {
  const factory _Extension(
      {required String code, required Exception exception}) = _$_Extension;
  const _Extension._() : super._();

  factory _Extension.fromJson(Map<String, dynamic> json) =
      _$_Extension.fromJson;

  @override
  String get code => throw _privateConstructorUsedError;
  @override
  Exception get exception => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ExtensionCopyWith<_Extension> get copyWith =>
      throw _privateConstructorUsedError;
}
