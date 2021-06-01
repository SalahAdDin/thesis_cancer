// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'profile.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
class _$ProfileTearOff {
  const _$ProfileTearOff();

  _Profile call(
      {String? firstName,
      String? lastName,
      UploadFile? profilePhoto,
      UserRole role = UserRole.GUEST,
      String? phoneNumber,
      bool? hasSeenTutorial,
      bool? hasSeenIntroductoryVideo,
      String? bio}) {
    return _Profile(
      firstName: firstName,
      lastName: lastName,
      profilePhoto: profilePhoto,
      role: role,
      phoneNumber: phoneNumber,
      hasSeenTutorial: hasSeenTutorial,
      hasSeenIntroductoryVideo: hasSeenIntroductoryVideo,
      bio: bio,
    );
  }

  Profile fromJson(Map<String, Object> json) {
    return Profile.fromJson(json);
  }
}

/// @nodoc
const $Profile = _$ProfileTearOff();

/// @nodoc
mixin _$Profile {
  String? get firstName => throw _privateConstructorUsedError;
  String? get lastName => throw _privateConstructorUsedError;
  UploadFile? get profilePhoto => throw _privateConstructorUsedError;
  UserRole get role => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  bool? get hasSeenTutorial => throw _privateConstructorUsedError;
  bool? get hasSeenIntroductoryVideo => throw _privateConstructorUsedError;
  String? get bio => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res>;
  $Res call(
      {String? firstName,
      String? lastName,
      UploadFile? profilePhoto,
      UserRole role,
      String? phoneNumber,
      bool? hasSeenTutorial,
      bool? hasSeenIntroductoryVideo,
      String? bio});

  $UploadFileCopyWith<$Res>? get profilePhoto;
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res> implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  final Profile _value;
  // ignore: unused_field
  final $Res Function(Profile) _then;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? profilePhoto = freezed,
    Object? role = freezed,
    Object? phoneNumber = freezed,
    Object? hasSeenTutorial = freezed,
    Object? hasSeenIntroductoryVideo = freezed,
    Object? bio = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhoto: profilePhoto == freezed
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as UploadFile?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSeenTutorial: hasSeenTutorial == freezed
          ? _value.hasSeenTutorial
          : hasSeenTutorial // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSeenIntroductoryVideo: hasSeenIntroductoryVideo == freezed
          ? _value.hasSeenIntroductoryVideo
          : hasSeenIntroductoryVideo // ignore: cast_nullable_to_non_nullable
              as bool?,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$ProfileCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$ProfileCopyWith(_Profile value, $Res Function(_Profile) then) =
      __$ProfileCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? firstName,
      String? lastName,
      UploadFile? profilePhoto,
      UserRole role,
      String? phoneNumber,
      bool? hasSeenTutorial,
      bool? hasSeenIntroductoryVideo,
      String? bio});

  @override
  $UploadFileCopyWith<$Res>? get profilePhoto;
}

/// @nodoc
class __$ProfileCopyWithImpl<$Res> extends _$ProfileCopyWithImpl<$Res>
    implements _$ProfileCopyWith<$Res> {
  __$ProfileCopyWithImpl(_Profile _value, $Res Function(_Profile) _then)
      : super(_value, (v) => _then(v as _Profile));

  @override
  _Profile get _value => super._value as _Profile;

  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? profilePhoto = freezed,
    Object? role = freezed,
    Object? phoneNumber = freezed,
    Object? hasSeenTutorial = freezed,
    Object? hasSeenIntroductoryVideo = freezed,
    Object? bio = freezed,
  }) {
    return _then(_Profile(
      firstName: firstName == freezed
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: lastName == freezed
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhoto: profilePhoto == freezed
          ? _value.profilePhoto
          : profilePhoto // ignore: cast_nullable_to_non_nullable
              as UploadFile?,
      role: role == freezed
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as UserRole,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      hasSeenTutorial: hasSeenTutorial == freezed
          ? _value.hasSeenTutorial
          : hasSeenTutorial // ignore: cast_nullable_to_non_nullable
              as bool?,
      hasSeenIntroductoryVideo: hasSeenIntroductoryVideo == freezed
          ? _value.hasSeenIntroductoryVideo
          : hasSeenIntroductoryVideo // ignore: cast_nullable_to_non_nullable
              as bool?,
      bio: bio == freezed
          ? _value.bio
          : bio // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Profile implements _Profile {
  const _$_Profile(
      {this.firstName,
      this.lastName,
      this.profilePhoto,
      this.role = UserRole.GUEST,
      this.phoneNumber,
      this.hasSeenTutorial,
      this.hasSeenIntroductoryVideo,
      this.bio});

  factory _$_Profile.fromJson(Map<String, dynamic> json) =>
      _$_$_ProfileFromJson(json);

  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final UploadFile? profilePhoto;
  @JsonKey(defaultValue: UserRole.GUEST)
  @override
  final UserRole role;
  @override
  final String? phoneNumber;
  @override
  final bool? hasSeenTutorial;
  @override
  final bool? hasSeenIntroductoryVideo;
  @override
  final String? bio;

  @override
  String toString() {
    return 'Profile(firstName: $firstName, lastName: $lastName, profilePhoto: $profilePhoto, role: $role, phoneNumber: $phoneNumber, hasSeenTutorial: $hasSeenTutorial, hasSeenIntroductoryVideo: $hasSeenIntroductoryVideo, bio: $bio)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Profile &&
            (identical(other.firstName, firstName) ||
                const DeepCollectionEquality()
                    .equals(other.firstName, firstName)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.profilePhoto, profilePhoto) ||
                const DeepCollectionEquality()
                    .equals(other.profilePhoto, profilePhoto)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.hasSeenTutorial, hasSeenTutorial) ||
                const DeepCollectionEquality()
                    .equals(other.hasSeenTutorial, hasSeenTutorial)) &&
            (identical(
                    other.hasSeenIntroductoryVideo, hasSeenIntroductoryVideo) ||
                const DeepCollectionEquality().equals(
                    other.hasSeenIntroductoryVideo,
                    hasSeenIntroductoryVideo)) &&
            (identical(other.bio, bio) ||
                const DeepCollectionEquality().equals(other.bio, bio)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(firstName) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(profilePhoto) ^
      const DeepCollectionEquality().hash(role) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(hasSeenTutorial) ^
      const DeepCollectionEquality().hash(hasSeenIntroductoryVideo) ^
      const DeepCollectionEquality().hash(bio);

  @JsonKey(ignore: true)
  @override
  _$ProfileCopyWith<_Profile> get copyWith =>
      __$ProfileCopyWithImpl<_Profile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ProfileToJson(this);
  }
}

abstract class _Profile implements Profile {
  const factory _Profile(
      {String? firstName,
      String? lastName,
      UploadFile? profilePhoto,
      UserRole role,
      String? phoneNumber,
      bool? hasSeenTutorial,
      bool? hasSeenIntroductoryVideo,
      String? bio}) = _$_Profile;

  factory _Profile.fromJson(Map<String, dynamic> json) = _$_Profile.fromJson;

  @override
  String? get firstName => throw _privateConstructorUsedError;
  @override
  String? get lastName => throw _privateConstructorUsedError;
  @override
  UploadFile? get profilePhoto => throw _privateConstructorUsedError;
  @override
  UserRole get role => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  bool? get hasSeenTutorial => throw _privateConstructorUsedError;
  @override
  bool? get hasSeenIntroductoryVideo => throw _privateConstructorUsedError;
  @override
  String? get bio => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ProfileCopyWith<_Profile> get copyWith =>
      throw _privateConstructorUsedError;
}
