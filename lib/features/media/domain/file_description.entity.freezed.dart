// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'file_description.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileDescription _$FileDescriptionFromJson(Map<String, dynamic> json) {
  return _FileDescription.fromJson(json);
}

/// @nodoc
class _$FileDescriptionTearOff {
  const _$FileDescriptionTearOff();

  _FileDescription call(
      {required String name,
      required String alternativeText,
      required String caption}) {
    return _FileDescription(
      name: name,
      alternativeText: alternativeText,
      caption: caption,
    );
  }

  FileDescription fromJson(Map<String, Object> json) {
    return FileDescription.fromJson(json);
  }
}

/// @nodoc
const $FileDescription = _$FileDescriptionTearOff();

/// @nodoc
mixin _$FileDescription {
  String get name => throw _privateConstructorUsedError;
  String get alternativeText => throw _privateConstructorUsedError;
  String get caption => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileDescriptionCopyWith<FileDescription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileDescriptionCopyWith<$Res> {
  factory $FileDescriptionCopyWith(
          FileDescription value, $Res Function(FileDescription) then) =
      _$FileDescriptionCopyWithImpl<$Res>;
  $Res call({String name, String alternativeText, String caption});
}

/// @nodoc
class _$FileDescriptionCopyWithImpl<$Res>
    implements $FileDescriptionCopyWith<$Res> {
  _$FileDescriptionCopyWithImpl(this._value, this._then);

  final FileDescription _value;
  // ignore: unused_field
  final $Res Function(FileDescription) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? alternativeText = freezed,
    Object? caption = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      alternativeText: alternativeText == freezed
          ? _value.alternativeText
          : alternativeText // ignore: cast_nullable_to_non_nullable
              as String,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$FileDescriptionCopyWith<$Res>
    implements $FileDescriptionCopyWith<$Res> {
  factory _$FileDescriptionCopyWith(
          _FileDescription value, $Res Function(_FileDescription) then) =
      __$FileDescriptionCopyWithImpl<$Res>;
  @override
  $Res call({String name, String alternativeText, String caption});
}

/// @nodoc
class __$FileDescriptionCopyWithImpl<$Res>
    extends _$FileDescriptionCopyWithImpl<$Res>
    implements _$FileDescriptionCopyWith<$Res> {
  __$FileDescriptionCopyWithImpl(
      _FileDescription _value, $Res Function(_FileDescription) _then)
      : super(_value, (v) => _then(v as _FileDescription));

  @override
  _FileDescription get _value => super._value as _FileDescription;

  @override
  $Res call({
    Object? name = freezed,
    Object? alternativeText = freezed,
    Object? caption = freezed,
  }) {
    return _then(_FileDescription(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      alternativeText: alternativeText == freezed
          ? _value.alternativeText
          : alternativeText // ignore: cast_nullable_to_non_nullable
              as String,
      caption: caption == freezed
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FileDescription implements _FileDescription {
  const _$_FileDescription(
      {required this.name,
      required this.alternativeText,
      required this.caption});

  factory _$_FileDescription.fromJson(Map<String, dynamic> json) =>
      _$_$_FileDescriptionFromJson(json);

  @override
  final String name;
  @override
  final String alternativeText;
  @override
  final String caption;

  @override
  String toString() {
    return 'FileDescription(name: $name, alternativeText: $alternativeText, caption: $caption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _FileDescription &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.alternativeText, alternativeText) ||
                const DeepCollectionEquality()
                    .equals(other.alternativeText, alternativeText)) &&
            (identical(other.caption, caption) ||
                const DeepCollectionEquality().equals(other.caption, caption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(alternativeText) ^
      const DeepCollectionEquality().hash(caption);

  @JsonKey(ignore: true)
  @override
  _$FileDescriptionCopyWith<_FileDescription> get copyWith =>
      __$FileDescriptionCopyWithImpl<_FileDescription>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_FileDescriptionToJson(this);
  }
}

abstract class _FileDescription implements FileDescription {
  const factory _FileDescription(
      {required String name,
      required String alternativeText,
      required String caption}) = _$_FileDescription;

  factory _FileDescription.fromJson(Map<String, dynamic> json) =
      _$_FileDescription.fromJson;

  @override
  String get name => throw _privateConstructorUsedError;
  @override
  String get alternativeText => throw _privateConstructorUsedError;
  @override
  String get caption => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$FileDescriptionCopyWith<_FileDescription> get copyWith =>
      throw _privateConstructorUsedError;
}
