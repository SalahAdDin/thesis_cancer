import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/local_notification_service.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/domain/settings/schedules.entity.dart';
import 'package:thesis_cancer/core/domain/settings/settings.entity.dart';
import 'package:thesis_cancer/core/domain/settings/settings.repository.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/media/application/uploadfile.provider.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

/// Settings Notifier
class SettingsNotifier extends StateNotifier<Settings> {
  /// Notifier constructor
  /// Receives a [Reader] from which notifier will get all dependencies.
  /// Throws the initialization function.
  SettingsNotifier({required this.reader}) : super(Settings.empty);

  ///
  final Reader reader;

  ///
  DataStoreRepository get dataStore => reader(dataStoreRepositoryProvider);

  CacheManager get _cacheManager => reader(cacheManagerProvider);

  ///
  SettingsRepository get settingsRepository =>
      reader(settingsRepositoryProvider);

  ///
  StateController<User?> get userController =>
      reader(userEntityProvider.notifier);

  ///
  User? get currentUser => userController.state;

  ///
  Future<void> toggleDarkMode() async {
    // final darkMode = currentSettings.state.darkMode;
    final bool darkMode = state.darkTheme;
    state = state.copyWith(darkTheme: !darkMode);
  }

  ///
  void scheduleNotifications(List<SurveySchedule> surveySchedules) {
    for (final SurveySchedule element in surveySchedules) {
      final ActivityFeed feed = ActivityFeed(
        type: ActivityType.NEW_SURVEY_SCHEDULED,
        issuerID: element.survey,
        description: "A new ${element.label} survey is waiting for you.",
      );
      for (int i = 1; i < element.iterations; i++) {
        LocalNotificationService().scheduleNotificationByWeeks(
          feed: feed.copyWith(id: "SS_$i"),
          notificationDetails:
              LocalNotificationService().contentNotificationDetails,
          step: element.step * i,
        );
      }
    }
  }

  ///
  Future<void> init() async {
    final Settings settings = await dataStore.getSettings();

    if (settings == Settings.empty) {
      final Map<String, dynamic> result =
          await settingsRepository.fetchSettings() as Map<String, dynamic>;
      final Settings fetchedSettings = Settings.fromJson(result);
      await dataStore.writeSettings(settings);

      if (fetchedSettings.introductoryVideo != null &&
          fetchedSettings.introductoryVideo?.url != null) {
        _cacheManager.downloadFile(fetchedSettings.introductoryVideo!.url);
      }

      // Local notifications will be scheduled at first app launch.
      // At this moment there is no any settings on the storage.
      /* TODO: Watch here if the user is logged,
          don't schedule till the user is logged in.
      */
      if (fetchedSettings.surveySchedules != null &&
          fetchedSettings.surveySchedules!.isNotEmpty) {
        // && currentUser != User.empty) {
        scheduleNotifications(fetchedSettings.surveySchedules!);
      }

      state = fetchedSettings;
    } else {
      state = settings;
    }
  }
}
