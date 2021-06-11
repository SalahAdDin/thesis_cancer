import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/domain/settings/schedules.entity.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';

part 'settings.entity.freezed.dart';
part 'settings.entity.g.dart';

/// Settings Entity
@freezed
class Settings with _$Settings {
  /// Default builder
  const factory Settings({
    UploadFile? introductoryVideo,
    String? registeringSurvey, // Survey ID
    List<SurveySchedule>? surveySchedules,
    @Default(false) bool darkTheme,
  }) = _Settings;

  /// Builds a [Settings] from a given json [String].
  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  /// Builds a empty(dummy) [Settings].
  static const Settings empty = Settings();
}
