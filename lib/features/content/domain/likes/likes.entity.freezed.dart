// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'likes.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Like _$LikeFromJson(Map<String, dynamic> json) {
  return _Like.fromJson(json);
}

/// @nodoc
class _$LikeTearOff {
  const _$LikeTearOff();

  _Like call(
      {required String id, required String postID, required String userID}) {
    return _Like(
      id: id,
      postID: postID,
      userID: userID,
    );
  }

  Like fromJson(Map<String, Object> json) {
    return Like.fromJson(json);
  }
}

/// @nodoc
const $Like = _$LikeTearOff();

/// @nodoc
mixin _$Like {
  String get id => throw _privateConstructorUsedError;
  String get postID => throw _privateConstructorUsedError;
  String get userID => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LikeCopyWith<Like> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeCopyWith<$Res> {
  factory $LikeCopyWith(Like value, $Res Function(Like) then) =
      _$LikeCopyWithImpl<$Res>;
  $Res call({String id, String postID, String userID});
}

/// @nodoc
class _$LikeCopyWithImpl<$Res> implements $LikeCopyWith<$Res> {
  _$LikeCopyWithImpl(this._value, this._then);

  final Like _value;
  // ignore: unused_field
  final $Res Function(Like) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? postID = freezed,
    Object? userID = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postID: postID == freezed
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$LikeCopyWith<$Res> implements $LikeCopyWith<$Res> {
  factory _$LikeCopyWith(_Like value, $Res Function(_Like) then) =
      __$LikeCopyWithImpl<$Res>;
  @override
  $Res call({String id, String postID, String userID});
}

/// @nodoc
class __$LikeCopyWithImpl<$Res> extends _$LikeCopyWithImpl<$Res>
    implements _$LikeCopyWith<$Res> {
  __$LikeCopyWithImpl(_Like _value, $Res Function(_Like) _then)
      : super(_value, (v) => _then(v as _Like));

  @override
  _Like get _value => super._value as _Like;

  @override
  $Res call({
    Object? id = freezed,
    Object? postID = freezed,
    Object? userID = freezed,
  }) {
    return _then(_Like(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postID: postID == freezed
          ? _value.postID
          : postID // ignore: cast_nullable_to_non_nullable
              as String,
      userID: userID == freezed
          ? _value.userID
          : userID // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Like implements _Like {
  const _$_Like({required this.id, required this.postID, required this.userID});

  factory _$_Like.fromJson(Map<String, dynamic> json) =>
      _$_$_LikeFromJson(json);

  @override
  final String id;
  @override
  final String postID;
  @override
  final String userID;

  @override
  String toString() {
    return 'Like(id: $id, postID: $postID, userID: $userID)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Like &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.postID, postID) ||
                const DeepCollectionEquality().equals(other.postID, postID)) &&
            (identical(other.userID, userID) ||
                const DeepCollectionEquality().equals(other.userID, userID)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(postID) ^
      const DeepCollectionEquality().hash(userID);

  @JsonKey(ignore: true)
  @override
  _$LikeCopyWith<_Like> get copyWith =>
      __$LikeCopyWithImpl<_Like>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_LikeToJson(this);
  }
}

abstract class _Like implements Like {
  const factory _Like(
      {required String id,
      required String postID,
      required String userID}) = _$_Like;

  factory _Like.fromJson(Map<String, dynamic> json) = _$_Like.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get postID => throw _privateConstructorUsedError;
  @override
  String get userID => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$LikeCopyWith<_Like> get copyWith => throw _privateConstructorUsedError;
}
