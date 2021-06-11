// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'activityfeed.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ActivityFeed _$ActivityFeedFromJson(Map<String, dynamic> json) {
  return _ActivityFeed.fromJson(json);
}

/// @nodoc
class _$ActivityFeedTearOff {
  const _$ActivityFeedTearOff();

  _ActivityFeed call(
      {String? id,
      required ActivityType type,
      required String issuerID,
      required String description}) {
    return _ActivityFeed(
      id: id,
      type: type,
      issuerID: issuerID,
      description: description,
    );
  }

  ActivityFeed fromJson(Map<String, Object> json) {
    return ActivityFeed.fromJson(json);
  }
}

/// @nodoc
const $ActivityFeed = _$ActivityFeedTearOff();

/// @nodoc
mixin _$ActivityFeed {
  String? get id => throw _privateConstructorUsedError;
  ActivityType get type => throw _privateConstructorUsedError;
  String get issuerID => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ActivityFeedCopyWith<ActivityFeed> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ActivityFeedCopyWith<$Res> {
  factory $ActivityFeedCopyWith(
          ActivityFeed value, $Res Function(ActivityFeed) then) =
      _$ActivityFeedCopyWithImpl<$Res>;
  $Res call(
      {String? id, ActivityType type, String issuerID, String description});
}

/// @nodoc
class _$ActivityFeedCopyWithImpl<$Res> implements $ActivityFeedCopyWith<$Res> {
  _$ActivityFeedCopyWithImpl(this._value, this._then);

  final ActivityFeed _value;
  // ignore: unused_field
  final $Res Function(ActivityFeed) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? issuerID = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActivityType,
      issuerID: issuerID == freezed
          ? _value.issuerID
          : issuerID // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$ActivityFeedCopyWith<$Res>
    implements $ActivityFeedCopyWith<$Res> {
  factory _$ActivityFeedCopyWith(
          _ActivityFeed value, $Res Function(_ActivityFeed) then) =
      __$ActivityFeedCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id, ActivityType type, String issuerID, String description});
}

/// @nodoc
class __$ActivityFeedCopyWithImpl<$Res> extends _$ActivityFeedCopyWithImpl<$Res>
    implements _$ActivityFeedCopyWith<$Res> {
  __$ActivityFeedCopyWithImpl(
      _ActivityFeed _value, $Res Function(_ActivityFeed) _then)
      : super(_value, (v) => _then(v as _ActivityFeed));

  @override
  _ActivityFeed get _value => super._value as _ActivityFeed;

  @override
  $Res call({
    Object? id = freezed,
    Object? type = freezed,
    Object? issuerID = freezed,
    Object? description = freezed,
  }) {
    return _then(_ActivityFeed(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as ActivityType,
      issuerID: issuerID == freezed
          ? _value.issuerID
          : issuerID // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ActivityFeed extends _ActivityFeed {
  const _$_ActivityFeed(
      {this.id,
      required this.type,
      required this.issuerID,
      required this.description})
      : super._();

  factory _$_ActivityFeed.fromJson(Map<String, dynamic> json) =>
      _$_$_ActivityFeedFromJson(json);

  @override
  final String? id;
  @override
  final ActivityType type;
  @override
  final String issuerID;
  @override
  final String description;

  @override
  String toString() {
    return 'ActivityFeed(id: $id, type: $type, issuerID: $issuerID, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _ActivityFeed &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.issuerID, issuerID) ||
                const DeepCollectionEquality()
                    .equals(other.issuerID, issuerID)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(issuerID) ^
      const DeepCollectionEquality().hash(description);

  @JsonKey(ignore: true)
  @override
  _$ActivityFeedCopyWith<_ActivityFeed> get copyWith =>
      __$ActivityFeedCopyWithImpl<_ActivityFeed>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_ActivityFeedToJson(this);
  }
}

abstract class _ActivityFeed extends ActivityFeed {
  const factory _ActivityFeed(
      {String? id,
      required ActivityType type,
      required String issuerID,
      required String description}) = _$_ActivityFeed;
  const _ActivityFeed._() : super._();

  factory _ActivityFeed.fromJson(Map<String, dynamic> json) =
      _$_ActivityFeed.fromJson;

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  ActivityType get type => throw _privateConstructorUsedError;
  @override
  String get issuerID => throw _privateConstructorUsedError;
  @override
  String get description => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$ActivityFeedCopyWith<_ActivityFeed> get copyWith =>
      throw _privateConstructorUsedError;
}
