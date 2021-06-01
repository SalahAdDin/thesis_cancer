// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'uploadfile.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UploadFile _$UploadFileFromJson(Map<String, dynamic> json) {
  return _UploadFile.fromJson(json);
}

/// @nodoc
class _$UploadFileTearOff {
  const _$UploadFileTearOff();

  _UploadFile call(
      {required String alternativeText,
      required String caption,
      required String url,
      int? width,
      int? height}) {
    return _UploadFile(
      alternativeText: alternativeText,
      caption: caption,
      url: url,
      width: width,
      height: height,
    );
  }

  UploadFile fromJson(Map<String, Object> json) {
    return UploadFile.fromJson(json);
  }
}

/// @nodoc
const $UploadFile = _$UploadFileTearOff();

/// @nodoc
mixin _$UploadFile {
  String get alternativeText => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  int? get width => throw _privateConstructorUsedError;
  int? get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UploadFileCopyWith<UploadFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadFileCopyWith<$Res> {
  factory $UploadFileCopyWith(
          UploadFile value, $Res Function(UploadFile) then) =
      _$UploadFileCopyWithImpl<$Res>;
  $Res call(
      {String alternativeText,
      String caption,
      String url,
      int? width,
      int? height});
}

/// @nodoc
class _$UploadFileCopyWithImpl<$Res> implements $UploadFileCopyWith<$Res> {
  _$UploadFileCopyWithImpl(this._value, this._then);

  final UploadFile _value;
  // ignore: unused_field
  final $Res Function(UploadFile) _then;

  @override
  $Res call({
    Object? alternativeText = freezed,
    Object? caption = freezed,
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_value.copyWith(
      alternativeText: alternativeText == freezed
          ? _value.alternativeText
          : alternativeText // ignore: cast_nullable_to_non_nullable
              as String,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
abstract class _$UploadFileCopyWith<$Res> implements $UploadFileCopyWith<$Res> {
  factory _$UploadFileCopyWith(
          _UploadFile value, $Res Function(_UploadFile) then) =
      __$UploadFileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String alternativeText,
      String caption,
      String url,
      int? width,
      int? height});
}

/// @nodoc
class __$UploadFileCopyWithImpl<$Res> extends _$UploadFileCopyWithImpl<$Res>
    implements _$UploadFileCopyWith<$Res> {
  __$UploadFileCopyWithImpl(
      _UploadFile _value, $Res Function(_UploadFile) _then)
      : super(_value, (v) => _then(v as _UploadFile));

  @override
  _UploadFile get _value => super._value as _UploadFile;

  @override
  $Res call({
    Object? alternativeText = freezed,
    Object? caption = freezed,
    Object? url = freezed,
    Object? width = freezed,
    Object? height = freezed,
  }) {
    return _then(_UploadFile(
      alternativeText: alternativeText == freezed
          ? _value.alternativeText
          : alternativeText // ignore: cast_nullable_to_non_nullable
              as String,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int?,
      height: height == freezed
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UploadFile implements _UploadFile {
  const _$_UploadFile(
      {required this.alternativeText,
      required this.caption,
      required this.url,
      this.width,
      this.height});

  factory _$_UploadFile.fromJson(Map<String, dynamic> json) =>
      _$_$_UploadFileFromJson(json);

  @override
  final String alternativeText;
  @override
  final String caption;
  @override
  final String url;
  @override
  final int? width;
  @override
  final int? height;

  @override
  String toString() {
    return 'UploadFile(alternativeText: $alternativeText, caption: $caption, url: $url, width: $width, height: $height)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UploadFile &&
            (identical(other.alternativeText, alternativeText) ||
                const DeepCollectionEquality()
                    .equals(other.alternativeText, alternativeText)) &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality()
                    .equals(other.caption, caption)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.width, width) ||
                const DeepCollectionEquality().equals(other.width, width)) &&
            (identical(other.height, height) ||
                const DeepCollectionEquality().equals(other.height, height)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(alternativeText) ^
      const DeepCollectionEquality().hash(caption) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(width) ^
      const DeepCollectionEquality().hash(height);

  @JsonKey(ignore: true)
  @override
  _$UploadFileCopyWith<_UploadFile> get copyWith =>
      __$UploadFileCopyWithImpl<_UploadFile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UploadFileToJson(this);
  }
}

abstract class _UploadFile implements UploadFile {
  const factory _UploadFile(
      {required String alternativeText,
      required String caption,
      required String url,
      int? width,
      int? height}) = _$_UploadFile;

  factory _UploadFile.fromJson(Map<String, dynamic> json) =
      _$_UploadFile.fromJson;

  @override
  String get alternativeText => throw _privateConstructorUsedError;
  @override
  String get caption => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  int? get width => throw _privateConstructorUsedError;
  @override
  int? get height => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UploadFileCopyWith<_UploadFile> get copyWith =>
      throw _privateConstructorUsedError;
}
