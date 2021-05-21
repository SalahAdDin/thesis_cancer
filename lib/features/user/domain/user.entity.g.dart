// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$_$_UserFromJson(Map<String, dynamic> json) {
  return _$_User(
    id: json['id'] as String,
    email: json['email'] as String,
    username: json['username'] as String,
    role:
        _$enumDecodeNullable(_$UserRoleEnumMap, json['role']) ?? UserRole.GUEST,
    token: json['token'] as String?,
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    confirmed: json['confirmed'] as bool?,
    isLoggedIn: json['isLoggedIn'] as bool?,
    hasSeenTutorial: json['hasSeenTutorial'] as bool?,
    hasSeenIntroductoryVideo: json['hasSeenIntroductoryVideo'] as bool?,
    darkMode: json['darkMode'] as bool?,
    bio: json['bio'] as String?,
    profilePhoto: json['profilePhoto'] == null
        ? null
        : UploadFile.fromJson(json['profilePhoto'] as Map<String, dynamic>),
    surveyResults: (json['surveyResults'] as List<dynamic>?)
        ?.map((e) => UserSurveyResult.fromJson(e as Map<String, dynamic>))
        .toList(),
    posts: (json['posts'] as List<dynamic>?)
        ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
        .toList(),
    comments: (json['comments'] as List<dynamic>?)
        ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
        .toList(),
    likes: (json['likes'] as List<dynamic>?)
        ?.map((e) => Like.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_UserToJson(_$_User instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'username': instance.username,
      'role': _$UserRoleEnumMap[instance.role],
      'token': instance.token,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'phoneNumber': instance.phoneNumber,
      'confirmed': instance.confirmed,
      'isLoggedIn': instance.isLoggedIn,
      'hasSeenTutorial': instance.hasSeenTutorial,
      'hasSeenIntroductoryVideo': instance.hasSeenIntroductoryVideo,
      'darkMode': instance.darkMode,
      'bio': instance.bio,
      'profilePhoto': instance.profilePhoto,
      'surveyResults': instance.surveyResults,
      'posts': instance.posts,
      'comments': instance.comments,
      'likes': instance.likes,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$UserRoleEnumMap = {
  UserRole.ADMIN: 'ADMIN',
  UserRole.PILOT: 'PILOT',
  UserRole.TEST: 'TEST',
  UserRole.CONTROL: 'CONTROL',
  UserRole.GUEST: 'GUEST',
};
