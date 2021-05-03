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
      {required String id,
      required String url,
      String? description,
      String? postID,
      String? userID}) {
    return _UploadFile(
      id: id,
      url: url,
      description: description,
      postID: postID,
      userID: userID,
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
  String get id => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String? get postID => throw _privateConstructorUsedError;
  String? get userID => throw _privateConstructorUsedError;

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
      {String id,
      String url,
      String? description,
      String? postID,
      String? userID});
}

/// @nodoc
class _$UploadFileCopyWithImpl<$Res> implements $UploadFileCopyWith<$Res> {
  _$UploadFileCopyWithImpl(this._value, this._then);

  final UploadFile _value;
  // ignore: unused_field
  final $Res Function(UploadFile) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? url = freezed,
    Object? description = freezed,
    Object? postID = freezed,
    Object? userID = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      postID: postID == freezed
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
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
      {String id,
      String url,
      String? description,
      String? postID,
      String? userID});
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
    Object? id = freezed,
    Object? url = freezed,
    Object? description = freezed,
    Object? postID = freezed,
    Object? userID = freezed,
  }) {
    return _then(_UploadFile(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      postID: postID == freezed
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String?,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_UploadFile implements _UploadFile {
  const _$_UploadFile(
      {required this.id,
      required this.url,
      this.description,
      this.postID,
      this.userID});

  factory _$_UploadFile.fromJson(Map<String, dynamic> json) =>
      _$_$_UploadFileFromJson(json);

  @override
  final String id;
  @override
  final String url;
  @override
  final String? description;
  @override
  final String? postID;
  @override
  final String? userID;

  @override
  String toString() {
    return 'UploadFile(id: $id, url: $url, description: $description, postID: $postID, userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _UploadFile &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.postID, postID) ||
                const DeepCollectionEquality().equals(other.postID, postID)) &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(postID) ^
      const DeepCollectionEquality().hash(userID);

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
      {required String id,
      required String url,
      String? description,
      String? postID,
      String? userID}) = _$_UploadFile;

  factory _UploadFile.fromJson(Map<String, dynamic> json) =
      _$_UploadFile.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get url => throw _privateConstructorUsedError;
  @override
  String? get description => throw _privateConstructorUsedError;
  @override
  String? get postID => throw _privateConstructorUsedError;
  @override
  String? get userID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UploadFileCopyWith<_UploadFile> get copyWith =>
      throw _privateConstructorUsedError;
}
