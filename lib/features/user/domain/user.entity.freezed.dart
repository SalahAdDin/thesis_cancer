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
      required String displayName,
      required UserRole role,
      String? phoneNumber,
      bool? confirmed,
      bool? isLoggedIn,
      bool? hasSeenTutorial,
      bool? hasSeenIntroductoryVideo,
      bool? darkMode,
      String? bio,
      UploadFile? profilePhoto,
      List<UserSurveyResult>? surveyResults,
      List<Post>? posts,
      List<Comment>? comments,
      List<Like>? likes}) {
    return _User(
      id: id,
      email: email,
      displayName: displayName,
      role: role,
      phoneNumber: phoneNumber,
      confirmed: confirmed,
      isLoggedIn: isLoggedIn,
      hasSeenTutorial: hasSeenTutorial,
      hasSeenIntroductoryVideo: hasSeenIntroductoryVideo,
      darkMode: darkMode,
      bio: bio,
      profilePhoto: profilePhoto,
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
  String get displayName => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  bool? get confirmed => throw _privateConstructorUsedError;
  bool? get isLoggedIn => throw _privateConstructorUsedError;
  bool? get hasSeenTutorial => throw _privateConstructorUsedError;
  bool? get hasSeenIntroductoryVideo => throw _privateConstructorUsedError;
  bool? get darkMode => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;
  UploadFile? get profilePhoto =>
      throw _privateConstructorUsedError; // TODO: how to properly handle this?
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
      String displayName,
      UserRole role,
      String? phoneNumber,
      bool? confirmed,
      bool? isLoggedIn,
      bool? hasSeenTutorial,
      bool? hasSeenIntroductoryVideo,
      bool? darkMode,
      String? bio,
      UploadFile? profilePhoto,
      List<UserSurveyResult>? surveyResults,
      List<Post>? posts,
      List<Comment>? comments,
      List<Like>? likes});

  $UploadFileCopyWith<$Res>? get profilePhoto;
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
    Object? displayName = freezed,
    Object? role = freezed,
    Object? phoneNumber = freezed,
    Object? confirmed = freezed,
    Object? isLoggedIn = freezed,
    Object? hasSeenTutorial = freezed,
    Object? hasSeenIntroductoryVideo = freezed,
    Object? darkMode = freezed,
    Object? bio = freezed,
    Object? profilePhoto = freezed,
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
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmed: confirmed == freezed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSeenTutorial: hasSeenTutorial == freezed
          ? _value.hasSeenTutorial
          : hasSeenTutorial // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSeenIntroductoryVideo: hasSeenIntroductoryVideo == freezed
          ? _value.hasSeenIntroductoryVideo
          : hasSeenIntroductoryVideo // ignore: cast_nullable_to_non_nullable
              as bool?,
      darkMode: darkMode == freezed
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhoto: profilePhoto == freezed
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as UploadFile?,
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
  $UploadFileCopyWith<$Res>? get profilePhoto {
    if (_value.profilePhoto == null) {
      return null;
    }

    return $UploadFileCopyWith<$Res>(_value.profilePhoto!, (value) {
      return _then(_value.copyWith(profilePhoto: value));
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
      String displayName,
      UserRole role,
      String? phoneNumber,
      bool? confirmed,
      bool? isLoggedIn,
      bool? hasSeenTutorial,
      bool? hasSeenIntroductoryVideo,
      bool? darkMode,
      String? bio,
      UploadFile? profilePhoto,
      List<UserSurveyResult>? surveyResults,
      List<Post>? posts,
      List<Comment>? comments,
      List<Like>? likes});

  @override
  $UploadFileCopyWith<$Res>? get profilePhoto;
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
    Object? displayName = freezed,
    Object? role = freezed,
    Object? phoneNumber = freezed,
    Object? confirmed = freezed,
    Object? isLoggedIn = freezed,
    Object? hasSeenTutorial = freezed,
    Object? hasSeenIntroductoryVideo = freezed,
    Object? darkMode = freezed,
    Object? bio = freezed,
    Object? profilePhoto = freezed,
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
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmed: confirmed == freezed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLoggedIn: isLoggedIn == freezed
          ? _value.isLoggedIn
          : isLoggedIn // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSeenTutorial: hasSeenTutorial == freezed
          ? _value.hasSeenTutorial
          : hasSeenTutorial // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSeenIntroductoryVideo: hasSeenIntroductoryVideo == freezed
          ? _value.hasSeenIntroductoryVideo
          : hasSeenIntroductoryVideo // ignore: cast_nullable_to_non_nullable
              as bool?,
      darkMode: darkMode == freezed
          ? _value.darkMode
          : darkMode // ignore: cast_nullable_to_non_nullable
              as bool?,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhoto: profilePhoto == freezed
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as UploadFile?,
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
      required this.displayName,
      required this.role,
      this.phoneNumber,
      this.confirmed,
      this.isLoggedIn,
      this.hasSeenTutorial,
      this.hasSeenIntroductoryVideo,
      this.darkMode,
      this.bio,
      this.profilePhoto,
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
  final String displayName;
  @override
  final UserRole role;
  @override
  final String? phoneNumber;
  @override
  final bool? confirmed;
  @override
  final bool? isLoggedIn;
  @override
  final bool? hasSeenTutorial;
  @override
  final bool? hasSeenIntroductoryVideo;
  @override
  final bool? darkMode;
  @override
  final String? bio;
  @override
  final UploadFile? profilePhoto;
  @override // TODO: how to properly handle this?
  final List<UserSurveyResult>? surveyResults;
  @override
  final List<Post>? posts;
  @override
  final List<Comment>? comments;
  @override
  final List<Like>? likes;

  @override
  String toString() {
    return 'User(id: $id, email: $email, displayName: $displayName, role: $role, phoneNumber: $phoneNumber, confirmed: $confirmed, isLoggedIn: $isLoggedIn, hasSeenTutorial: $hasSeenTutorial, hasSeenIntroductoryVideo: $hasSeenIntroductoryVideo, darkMode: $darkMode, bio: $bio, profilePhoto: $profilePhoto, surveyResults: $surveyResults, posts: $posts, comments: $comments, likes: $likes)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.confirmed, confirmed) ||
                const DeepCollectionEquality()
                    .equals(other.confirmed, confirmed)) &&
            (identical(other.isLoggedIn, isLoggedIn) ||
                const DeepCollectionEquality()
                    .equals(other.isLoggedIn, isLoggedIn)) &&
            (identical(other.hasSeenTutorial, hasSeenTutorial) ||
                const DeepCollectionEquality()
                    .equals(other.hasSeenTutorial, hasSeenTutorial)) &&
            (identical(
                    other.hasSeenIntroductoryVideo, hasSeenIntroductoryVideo) ||
                const DeepCollectionEquality().equals(
                    other.hasSeenIntroductoryVideo,
                    hasSeenIntroductoryVideo)) &&
            (identical(other.darkMode, darkMode) ||
                const DeepCollectionEquality()
                    .equals(other.darkMode, darkMode)) &&
            (identical(other.bio, bio) ||
                const DeepCollectionEquality().equals(other.bio, bio)) &&
            (identical(other.profilePhoto, profilePhoto) ||
                const DeepCollectionEquality()
                    .equals(other.profilePhoto, profilePhoto)) &&
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
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(confirmed) ^
      const DeepCollectionEquality().hash(isLoggedIn) ^
      const DeepCollectionEquality().hash(hasSeenTutorial) ^
      const DeepCollectionEquality().hash(hasSeenIntroductoryVideo) ^
      const DeepCollectionEquality().hash(darkMode) ^
      const DeepCollectionEquality().hash(bio) ^
      const DeepCollectionEquality().hash(profilePhoto) ^
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
      required String displayName,
      required UserRole role,
      String? phoneNumber,
      bool? confirmed,
      bool? isLoggedIn,
      bool? hasSeenTutorial,
      bool? hasSeenIntroductoryVideo,
      bool? darkMode,
      String? bio,
      UploadFile? profilePhoto,
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
  String get displayName => throw _privateConstructorUsedError;
  @override
  UserRole get role => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  bool? get confirmed => throw _privateConstructorUsedError;
  @override
  bool? get isLoggedIn => throw _privateConstructorUsedError;
  @override
  bool? get hasSeenTutorial => throw _privateConstructorUsedError;
  @override
  bool? get hasSeenIntroductoryVideo => throw _privateConstructorUsedError;
  @override
  bool? get darkMode => throw _privateConstructorUsedError;
  @override
  String? get bio => throw _privateConstructorUsedError;
  @override
  UploadFile? get profilePhoto => throw _privateConstructorUsedError;
  @override // TODO: how to properly handle this?
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
