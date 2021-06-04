// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'post.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
class _$PostTearOff {
  const _$PostTearOff();

  _Post call(
      {required String id,
      required ContentType type,
      required String description,
      required List<UploadFile> gallery,
      String? title,
      DateTime? createdAt,
      List<Comment>? comments,
      List<Like>? likes,
      int likesCount = 0}) {
    return _Post(
      id: id,
      type: type,
      description: description,
      gallery: gallery,
      title: title,
      createdAt: createdAt,
      comments: comments,
      likes: likes,
      likesCount: likesCount,
    );
  }

  Post fromJson(Map<String, Object> json) {
    return Post.fromJson(json);
  }
}

/// @nodoc
const $Post = _$PostTearOff();

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  ContentType get type => throw _privateConstructorUsedError;
  String get description =>
      throw _privateConstructorUsedError; // required String author,
  List<UploadFile> get gallery => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;
  List<Comment>? get comments => throw _privateConstructorUsedError;
  List<Like>? get likes => throw _privateConstructorUsedError;
  int get likesCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res>;
  $Res call(
      {String id,
      ContentType type,
      String description,
      List<UploadFile> gallery,
      String? title,
      DateTime? createdAt,
      List<Comment>? comments,
      List<Like>? likes,
      int likesCount});
}

/// @nodoc
class _$PostCopyWithImpl<$Res> implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  final Post _value;
  // ignore: unused_field
  final $Res Function(Post) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? gallery = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? comments = freezed,
    Object? likes = freezed,
    Object? likesCount = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentType,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      gallery: gallery == freezed
          ? _value.gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as List<UploadFile>,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<Like>?,
      likesCount: likesCount == freezed
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
abstract class _$PostCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$PostCopyWith(_Post value, $Res Function(_Post) then) =
      __$PostCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      ContentType type,
      String description,
      List<UploadFile> gallery,
      String? title,
      DateTime? createdAt,
      List<Comment>? comments,
      List<Like>? likes,
      int likesCount});
}

/// @nodoc
class __$PostCopyWithImpl<$Res> extends _$PostCopyWithImpl<$Res>
    implements _$PostCopyWith<$Res> {
  __$PostCopyWithImpl(_Post _value, $Res Function(_Post) _then)
      : super(_value, (v) => _then(v as _Post));

  @override
  _Post get _value => super._value as _Post;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? description = freezed,
    Object? gallery = freezed,
    Object? title = freezed,
    Object? createdAt = freezed,
    Object? comments = freezed,
    Object? likes = freezed,
    Object? likesCount = freezed,
  }) {
    return _then(_Post(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ContentType,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      gallery: gallery == freezed
          ? _value.gallery
          : gallery // ignore: cast_nullable_to_non_nullable
              as List<UploadFile>,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: createdAt == freezed
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<Like>?,
      likesCount: likesCount == freezed
          ? _value.likesCount
          : likesCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Post implements _Post {
  const _$_Post(
      {required this.id,
      required this.type,
      required this.description,
      required this.gallery,
      this.title,
      this.createdAt,
      this.comments,
      this.likes,
      this.likesCount = 0});

  factory _$_Post.fromJson(Map<String, dynamic> json) =>
      _$_$_PostFromJson(json);

  @override
  final String id;
  @override
  final ContentType type;
  @override
  final String description;
  @override // required String author,
  final List<UploadFile> gallery;
  @override
  final String? title;
  @override
  final DateTime? createdAt;
  @override
  final List<Comment>? comments;
  @override
  final List<Like>? likes;
  @JsonKey(defaultValue: 0)
  @override
  final int likesCount;

  @override
  String toString() {
    return 'Post(id: $id, type: $type, description: $description, gallery: $gallery, title: $title, createdAt: $createdAt, comments: $comments, likes: $likes, likesCount: $likesCount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Post &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.gallery, gallery) ||
                const DeepCollectionEquality()
                    .equals(other.gallery, gallery)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.createdAt, createdAt) ||
                const DeepCollectionEquality()
                    .equals(other.createdAt, createdAt)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)) &&
            (identical(other.likes, likes) ||
                const DeepCollectionEquality().equals(other.likes, likes)) &&
            (identical(other.likesCount, likesCount) ||
                const DeepCollectionEquality()
                    .equals(other.likesCount, likesCount)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(gallery) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(createdAt) ^
      const DeepCollectionEquality().hash(comments) ^
      const DeepCollectionEquality().hash(likes) ^
      const DeepCollectionEquality().hash(likesCount);

  @JsonKey(ignore: true)
  @override
  _$PostCopyWith<_Post> get copyWith =>
      __$PostCopyWithImpl<_Post>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_PostToJson(this);
  }
}

abstract class _Post implements Post {
  const factory _Post(
      {required String id,
      required ContentType type,
      required String description,
      required List<UploadFile> gallery,
      String? title,
      DateTime? createdAt,
      List<Comment>? comments,
      List<Like>? likes,
      int likesCount}) = _$_Post;

  factory _Post.fromJson(Map<String, dynamic> json) = _$_Post.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  ContentType get type => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override // required String author,
  List<UploadFile> get gallery => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @override
  List<Comment>? get comments => throw _privateConstructorUsedError;
  @override
  List<Like>? get likes => throw _privateConstructorUsedError;
  @override
  int get likesCount => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PostCopyWith<_Post> get copyWith => throw _privateConstructorUsedError;
}
