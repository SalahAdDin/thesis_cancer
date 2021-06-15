// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activityfeed.entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ActivityFeed _$_$_ActivityFeedFromJson(Map<String, dynamic> json) {
  return _$_ActivityFeed(
    id: json['id'] as String?,
    type: _$enumDecode(_$ActivityTypeEnumMap, json['type']),
    issuerID: json['issuerID'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$_$_ActivityFeedToJson(_$_ActivityFeed instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('id', instance.id);
  val['type'] = _$ActivityTypeEnumMap[instance.type];
  val['issuerID'] = instance.issuerID;
  val['description'] = instance.description;
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

const _$ActivityTypeEnumMap = {
  ActivityType.NEW_COMMENT: 'NEW_COMMENT',
  ActivityType.NEW_FOLLOW: 'NEW_FOLLOW',
  ActivityType.NEW_LIKE: 'NEW_LIKE',
  ActivityType.NEW_POST: 'NEW_POST',
  ActivityType.NEW_SURVEY_SCHEDULED: 'NEW_SURVEY_SCHEDULED',
  ActivityType.NEW_RECOMMENDATION: 'NEW_RECOMMENDATION',
};
