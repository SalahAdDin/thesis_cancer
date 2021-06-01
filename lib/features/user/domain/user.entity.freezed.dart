// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'user.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

User _$UserFromJson(Map<String, dynamic> json) {
  return _User.fromJson(json);
}

/// @nodoc
class _$UserTearOff {
  const _$UserTearOff();

  _User call(
      {required String id,
      required String email,
      required String username,
      Profile? profile,
      String? token,
      bool? confirmed,
      bool? isLoggedIn,
      List<UserSurveyResult>? surveyResults,
      List<Post>? posts,
      List<Comment>? comments,
      List<Like>? likes}) {
    return _User(
      id: id,
      email: email,
      username: username,
      profile: profile,
      token: token,
      confirmed: confirmed,
      isLoggedIn: isLoggedIn,
      surveyResults: surveyResults,
      posts: posts,
      comments: comments,
      likes: likes,
    );
  }

  User fromJson(Map<String, Object> json) {
    return User.fromJson(json);
  }
}

/// @nodoc
const $User = _$UserTearOff();

/// @nodoc
mixin _$User {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  Profile? get profile => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  bool? get confirmed => throw _privateConstructorUsedError;
  bool? get isLoggedIn => throw _privateConstructorUsedError;
  List<UserSurveyResult>? get surveyResults =>
      throw _privateConstructorUsedError;
  List<Post>? get posts => throw _privateConstructorUsedError;
  List<Comment>? get comments => throw _privateConstructorUsedError;
  List<Like>? get likes => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res>;
  $Res call(
      {String id,
      String email,
      String username,
      Profile? profile,
      String? token,
      bool? confirmed,
      bool? isLoggedIn,
      List<UserSurveyResult>? surveyResults,
      List<Post>? posts,
      List<Comment>? comments,
      List<Like>? likes});

  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class _$UserCopyWithImpl<$Res> implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  final User _value;
  // ignore: unused_field
  final $Res Function(User) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? profile = freezed,
    Object? token = freezed,
    Object? confirmed = freezed,
    Object? isLoggedIn = freezed,
    Object? surveyResults = freezed,
    Object? posts = freezed,
    Object? comments = freezed,
    Object? likes = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmed: confirmed == freezed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      surveyResults: surveyResults == freezed
          ? _value.surveyResults
          : surveyResults // ignore: cast_nullable_to_non_nullable
              as List<UserSurveyResult>?,
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>?,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<Like>?,
    ));
  }

  @override
  $ProfileCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value));
    });
  }
}

/// @nodoc
abstract class _$UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$UserCopyWith(_User value, $Res Function(_User) then) =
      __$UserCopyWithImpl<$Res>;
  @override
  $Res call(
      {String id,
      String email,
      String username,
      Profile? profile,
      String? token,
      bool? confirmed,
      bool? isLoggedIn,
      List<UserSurveyResult>? surveyResults,
      List<Post>? posts,
      List<Comment>? comments,
      List<Like>? likes});

  @override
  $ProfileCopyWith<$Res>? get profile;
}

/// @nodoc
class __$UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res>
    implements _$UserCopyWith<$Res> {
  __$UserCopyWithImpl(_User _value, $Res Function(_User) _then)
      : super(_value, (v) => _then(v as _User));

  @override
  _User get _value => super._value as _User;

  @override
  $Res call({
    Object? id = freezed,
    Object? email = freezed,
    Object? username = freezed,
    Object? profile = freezed,
    Object? token = freezed,
    Object? confirmed = freezed,
    Object? isLoggedIn = freezed,
    Object? surveyResults = freezed,
    Object? posts = freezed,
    Object? comments = freezed,
    Object? likes = freezed,
  }) {
    return _then(_User(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      username: username == freezed
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profile: profile == freezed
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as Profile?,
      token: token == freezed
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmed: confirmed == freezed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      surveyResults: surveyResults == freezed
          ? _value.surveyResults
          : surveyResults // ignore: cast_nullable_to_non_nullable
              as List<UserSurveyResult>?,
      posts: posts == freezed
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as List<Post>?,
      comments: comments == freezed
          ? _value.comments
          : comments // ignore: cast_nullable_to_non_nullable
              as List<Comment>?,
      likes: likes == freezed
          ? _value.likes
          : likes // ignore: cast_nullable_to_non_nullable
              as List<Like>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_User implements _User {
  const _$_User(
      {required this.id,
      required this.email,
      required this.username,
      this.profile,
      this.token,
      this.confirmed,
      this.isLoggedIn,
      this.surveyResults,
      this.posts,
      this.comments,
      this.likes});

  factory _$_User.fromJson(Map<String, dynamic> json) =>
      _$_$_UserFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String username;
  @override
  final Profile? profile;
  @override
  final String? token;
  @override
  final bool? confirmed;
  @override
  final bool? isLoggedIn;
  @override
  final List<UserSurveyResult>? surveyResults;
  @override
  final List<Post>? posts;
  @override
  final List<Comment>? comments;
  @override
  final List<Like>? likes;

  @override
  String toString() {
    return 'User(id: $id, email: $email, username: $username, profile: $profile, token: $token, confirmed: $confirmed, isLoggedIn: $isLoggedIn, surveyResults: $surveyResults, posts: $posts, comments: $comments, likes: $likes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.profile, profile) ||
                const DeepCollectionEquality()
                    .equals(other.profile, profile)) &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)) &&
            (identical(other.confirmed, confirmed) ||
                const DeepCollectionEquality()
                    .equals(other.confirmed, confirmed)) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                const DeepCollectionEquality()
                    .equals(other.isLoggedIn, isLoggedIn)) &&
            (identical(other.surveyResults, surveyResults) ||
                const DeepCollectionEquality()
                    .equals(other.surveyResults, surveyResults)) &&
            (identical(other.posts, posts) ||
                const DeepCollectionEquality().equals(other.posts, posts)) &&
            (identical(other.comments, comments) ||
                const DeepCollectionEquality()
                    .equals(other.comments, comments)) &&
            (identical(other.likes, likes) ||
                const DeepCollectionEquality().equals(other.likes, likes)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(profile) ^
      const DeepCollectionEquality().hash(token) ^
      const DeepCollectionEquality().hash(confirmed) ^
      const DeepCollectionEquality().hash(isLoggedIn) ^
      const DeepCollectionEquality().hash(surveyResults) ^
      const DeepCollectionEquality().hash(posts) ^
      const DeepCollectionEquality().hash(comments) ^
      const DeepCollectionEquality().hash(likes);

  @JsonKey(ignore: true)
  @override
  _$UserCopyWith<_User> get copyWith =>
      __$UserCopyWithImpl<_User>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_UserToJson(this);
  }
}

abstract class _User implements User {
  const factory _User(
      {required String id,
      required String email,
      required String username,
      Profile? profile,
      String? token,
      bool? confirmed,
      bool? isLoggedIn,
      List<UserSurveyResult>? surveyResults,
      List<Post>? posts,
      List<Comment>? comments,
      List<Like>? likes}) = _$_User;

  factory _User.fromJson(Map<String, dynamic> json) = _$_User.fromJson;

  @override
  String get id => throw _privateConstructorUsedError;
  @override
  String get email => throw _privateConstructorUsedError;
  @override
  String get username => throw _privateConstructorUsedError;
  @override
  Profile? get profile => throw _privateConstructorUsedError;
  @override
  String? get token => throw _privateConstructorUsedError;
  @override
  bool? get confirmed => throw _privateConstructorUsedError;
  @override
  bool? get isLoggedIn => throw _privateConstructorUsedError;
  @override
  List<UserSurveyResult>? get surveyResults =>
      throw _privateConstructorUsedError;
  @override
  List<Post>? get posts => throw _privateConstructorUsedError;
  @override
  List<Comment>? get comments => throw _privateConstructorUsedError;
  @override
  List<Like>? get likes => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$UserCopyWith<_User> get copyWith => throw _privateConstructorUsedError;
}
