// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Profile _$_$_ProfileFromJson(Map<String, dynamic> json) {
  return _$_Profile(
    firstName: json['firstName'] as String?,
    lastName: json['lastName'] as String?,
    profilePhoto: json['profilePhoto'] == null
        ? null
        : UploadFile.fromJson(json['profilePhoto'] as Map<String, dynamic>),
    role:
        _$enumDecodeNullable(_$UserRoleEnumMap, json['role']) ?? UserRole.GUEST,
    phoneNumber: json['phoneNumber'] as String?,
    hasSeenTutorial: json['hasSeenTutorial'] as bool?,
    hasSeenIntroductoryVideo: json['hasSeenIntroductoryVideo'] as bool?,
    bio: json['bio'] as String?,
  );
}

Map<String, dynamic> _$_$_ProfileToJson(_$_Profile instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePhoto': instance.profilePhoto?.toJson(),
      'role': _$UserRoleEnumMap[instance.role],
      'phoneNumber': instance.phoneNumber,
      'hasSeenTutorial': instance.hasSeenTutorial,
      'hasSeenIntroductoryVideo': instance.hasSeenIntroductoryVideo,
      'bio': instance.bio,
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
