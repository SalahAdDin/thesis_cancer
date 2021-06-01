import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:thesis_cancer/core/domain/settings/schedules.entity.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';

part 'settings.entity.freezed.dart';
part 'settings.entity.g.dart';

@freezed
class Settings with _$Settings {
  const factory Settings({
    UploadFile? introductoryVideo,
    String? registeringSurvey, // Survey ID
    List<SurveySchedule>? surveySchedules,
    @Default(false) bool darkTheme,
  }) = _Settings;

  factory Settings.fromJson(Map<String, dynamic> json) =>
      _$SettingsFromJson(json);

  static const empty = Settings();
}
