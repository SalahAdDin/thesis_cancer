// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Settings _$_$_SettingsFromJson(Map<String, dynamic> json) {
  return _$_Settings(
    introductoryVideo: json['introductoryVideo'] == null
        ? null
        : UploadFile.fromJson(
            json['introductoryVideo'] as Map<String, dynamic>),
    registeringSurvey: json['registeringSurvey'] as String?,
    surveySchedules: (json['surveySchedules'] as List<dynamic>?)
        ?.map((e) => SurveySchedule.fromJson(e as Map<String, dynamic>))
        .toList(),
    themeMode: _$enumDecodeNullable(_$ThemeModeEnumMap, json['themeMode']) ??
        ThemeMode.system,
  );
}

Map<String, dynamic> _$_$_SettingsToJson(_$_Settings instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('introductoryVideo', instance.introductoryVideo?.toJson());
  writeNotNull('registeringSurvey', instance.registeringSurvey);
  writeNotNull('surveySchedules',
      instance.surveySchedules?.map((e) => e.toJson()).toList());
  val['themeMode'] = _$ThemeModeEnumMap[instance.themeMode];
  return val;
}

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

const _$ThemeModeEnumMap = {
  ThemeMode.system: 'system',
  ThemeMode.light: 'light',
  ThemeMode.dark: 'dark',
};
