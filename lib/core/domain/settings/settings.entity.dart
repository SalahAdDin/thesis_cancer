import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/domain/settings/introvideo.entity.dart';
import 'package:thesis_cancer/core/domain/settings/schedules.entity.dart';

part 'settings.entity.freezed.dart';
part 'settings.entity.g.dart';

/// Settings Entity
@freezed
class Settings with _$Settings {
  /// Default builder
  const factory Settings({
    required List<IntroductoryVideo> introductoryVideo,
    String? registeringSurvey, // Survey ID
    List<SurveySchedule>? surveySchedules,
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _Settings;

  /// Builds a [Settings] from a given json [String].
  factory Settings.fromJson(Map<String, Object?> json) =>
      _$SettingsFromJson(json);

  /// Builds a empty(dummy) [Settings].
  static const Settings empty = Settings();
}
