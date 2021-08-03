// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'settings.entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Settings _$SettingsFromJson(Map<String, dynamic> json) {
  return _Settings.fromJson(json);
}

/// @nodoc
class _$SettingsTearOff {
  const _$SettingsTearOff();

  _Settings call(
      {UploadFile? introductoryVideo,
      String? registeringSurvey,
      List<SurveySchedule>? surveySchedules,
      ThemeMode themeMode = ThemeMode.system}) {
    return _Settings(
      introductoryVideo: introductoryVideo,
      registeringSurvey: registeringSurvey,
      surveySchedules: surveySchedules,
      themeMode: themeMode,
    );
  }

  Settings fromJson(Map<String, Object> json) {
    return Settings.fromJson(json);
  }
}

/// @nodoc
const $Settings = _$SettingsTearOff();

/// @nodoc
mixin _$Settings {
  UploadFile? get introductoryVideo => throw _privateConstructorUsedError;
  String? get registeringSurvey =>
      throw _privateConstructorUsedError; // Survey ID
  List<SurveySchedule>? get surveySchedules =>
      throw _privateConstructorUsedError;
  ThemeMode get themeMode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SettingsCopyWith<Settings> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettingsCopyWith<$Res> {
  factory $SettingsCopyWith(Settings value, $Res Function(Settings) then) =
      _$SettingsCopyWithImpl<$Res>;
  $Res call(
      {UploadFile? introductoryVideo,
      String? registeringSurvey,
      List<SurveySchedule>? surveySchedules,
      ThemeMode themeMode});

  $UploadFileCopyWith<$Res>? get introductoryVideo;
}

/// @nodoc
class _$SettingsCopyWithImpl<$Res> implements $SettingsCopyWith<$Res> {
  _$SettingsCopyWithImpl(this._value, this._then);

  final Settings _value;
  // ignore: unused_field
  final $Res Function(Settings) _then;

  @override
  $Res call({
    Object? introductoryVideo = freezed,
    Object? registeringSurvey = freezed,
    Object? surveySchedules = freezed,
    Object? themeMode = freezed,
  }) {
    return _then(_value.copyWith(
      introductoryVideo: introductoryVideo == freezed
          ? _value.introductoryVideo
          : introductoryVideo // ignore: cast_nullable_to_non_nullable
              as UploadFile?,
      registeringSurvey: registeringSurvey == freezed
          ? _value.registeringSurvey
          : registeringSurvey // ignore: cast_nullable_to_non_nullable
              as String?,
      surveySchedules: surveySchedules == freezed
          ? _value.surveySchedules
          : surveySchedules // ignore: cast_nullable_to_non_nullable
              as List<SurveySchedule>?,
      themeMode: themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }

  @override
  $UploadFileCopyWith<$Res>? get introductoryVideo {
    if (_value.introductoryVideo == null) {
      return null;
    }

    return $UploadFileCopyWith<$Res>(_value.introductoryVideo!, (value) {
      return _then(_value.copyWith(introductoryVideo: value));
    });
  }
}

/// @nodoc
abstract class _$SettingsCopyWith<$Res> implements $SettingsCopyWith<$Res> {
  factory _$SettingsCopyWith(_Settings value, $Res Function(_Settings) then) =
      __$SettingsCopyWithImpl<$Res>;
  @override
  $Res call(
      {UploadFile? introductoryVideo,
      String? registeringSurvey,
      List<SurveySchedule>? surveySchedules,
      ThemeMode themeMode});

  @override
  $UploadFileCopyWith<$Res>? get introductoryVideo;
}

/// @nodoc
class __$SettingsCopyWithImpl<$Res> extends _$SettingsCopyWithImpl<$Res>
    implements _$SettingsCopyWith<$Res> {
  __$SettingsCopyWithImpl(_Settings _value, $Res Function(_Settings) _then)
      : super(_value, (v) => _then(v as _Settings));

  @override
  _Settings get _value => super._value as _Settings;

  @override
  $Res call({
    Object? introductoryVideo = freezed,
    Object? registeringSurvey = freezed,
    Object? surveySchedules = freezed,
    Object? themeMode = freezed,
  }) {
    return _then(_Settings(
      introductoryVideo: introductoryVideo == freezed
          ? _value.introductoryVideo
          : introductoryVideo // ignore: cast_nullable_to_non_nullable
              as UploadFile?,
      registeringSurvey: registeringSurvey == freezed
          ? _value.registeringSurvey
          : registeringSurvey // ignore: cast_nullable_to_non_nullable
              as String?,
      surveySchedules: surveySchedules == freezed
          ? _value.surveySchedules
          : surveySchedules // ignore: cast_nullable_to_non_nullable
              as List<SurveySchedule>?,
      themeMode: themeMode == freezed
          ? _value.themeMode
          : themeMode // ignore: cast_nullable_to_non_nullable
              as ThemeMode,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Settings implements _Settings {
  const _$_Settings(
      {this.introductoryVideo,
      this.registeringSurvey,
      this.surveySchedules,
      this.themeMode = ThemeMode.system});

  factory _$_Settings.fromJson(Map<String, dynamic> json) =>
      _$_$_SettingsFromJson(json);

  @override
  final UploadFile? introductoryVideo;
  @override
  final String? registeringSurvey;
  @override // Survey ID
  final List<SurveySchedule>? surveySchedules;
  @JsonKey(defaultValue: ThemeMode.system)
  @override
  final ThemeMode themeMode;

  @override
  String toString() {
    return 'Settings(introductoryVideo: $introductoryVideo, registeringSurvey: $registeringSurvey, surveySchedules: $surveySchedules, themeMode: $themeMode)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Settings &&
            (identical(other.introductoryVideo, introductoryVideo) ||
                const DeepCollectionEquality()
                    .equals(other.introductoryVideo, introductoryVideo)) &&
            (identical(other.registeringSurvey, registeringSurvey) ||
                const DeepCollectionEquality()
                    .equals(other.registeringSurvey, registeringSurvey)) &&
            (identical(other.surveySchedules, surveySchedules) ||
                const DeepCollectionEquality()
                    .equals(other.surveySchedules, surveySchedules)) &&
            (identical(other.themeMode, themeMode) ||
                const DeepCollectionEquality()
                    .equals(other.themeMode, themeMode)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(introductoryVideo) ^
      const DeepCollectionEquality().hash(registeringSurvey) ^
      const DeepCollectionEquality().hash(surveySchedules) ^
      const DeepCollectionEquality().hash(themeMode);

  @JsonKey(ignore: true)
  @override
  _$SettingsCopyWith<_Settings> get copyWith =>
      __$SettingsCopyWithImpl<_Settings>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_SettingsToJson(this);
  }
}

abstract class _Settings implements Settings {
  const factory _Settings(
      {UploadFile? introductoryVideo,
      String? registeringSurvey,
      List<SurveySchedule>? surveySchedules,
      ThemeMode themeMode}) = _$_Settings;

  factory _Settings.fromJson(Map<String, dynamic> json) = _$_Settings.fromJson;

  @override
  UploadFile? get introductoryVideo => throw _privateConstructorUsedError;
  @override
  String? get registeringSurvey => throw _privateConstructorUsedError;
  @override // Survey ID
  List<SurveySchedule>? get surveySchedules =>
      throw _privateConstructorUsedError;
  @override
  ThemeMode get themeMode => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SettingsCopyWith<_Settings> get copyWith =>
      throw _privateConstructorUsedError;
}
