import 'package:thesis_cancer/core/domain/settings/settings.entity.dart';

/// Settings Repository Interface
abstract class SettingsRepository {
  ///
  Future<Settings> fetchSettings();
}
