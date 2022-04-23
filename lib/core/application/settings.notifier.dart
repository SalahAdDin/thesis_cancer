import 'package:colorize/colorize.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_local_notifications_platform_interface/src/types.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/local_notification_service.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/domain/settings/introvideo.entity.dart';
import 'package:thesis_cancer/core/domain/settings/schedules.entity.dart';
import 'package:thesis_cancer/core/domain/settings/settings.entity.dart';
import 'package:thesis_cancer/core/domain/settings/settings.repository.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/media/application/uploadfile.provider.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';

// import 'package:thesis_cancer/features/user/application/user.provider.dart';
// import 'package:thesis_cancer/features/user/domain/user.entity.dart';

/// Settings Notifier
class SettingsNotifier extends StateNotifier<Settings> {
  /// Notifier constructor
  /// Receives a [Reader] from which notifier will get all dependencies.
  /// Throws the initialization function.
  SettingsNotifier({required this.reader}) : super(Settings.empty);

  ///
  final Reader reader;

  ///
  DataStoreRepository get _dataStore => reader(dataStoreRepositoryProvider);

  CacheManager get _cacheManager => reader(cacheManagerProvider);

  ///
  SettingsRepository get _settingsRepository =>
      reader(settingsRepositoryProvider);

  ///
  // StateController<User?> get _userController => reader(userEntityProvider.notifier);

  ///
  // User? get _currentUser => _userController.state;

  ///
  Future<void> toggleThemeMode(ThemeMode mode) async {
    final Settings updatedState = state.copyWith(themeMode: mode);
    _dataStore.writeSettings(updatedState);
    state = updatedState;
  }

  ///
  Future<void> scheduleNotifications(
    List<SurveySchedule> surveySchedules,
  ) async {
    final List<PendingNotificationRequest> pendingLocalNotifications =
        await LocalNotificationService().getPendingNotifications();
    for (final SurveySchedule element in surveySchedules) {
      final ActivityFeed feed = ActivityFeed(
        type: ActivityType.SCHEDULED_SURVEY_REMINDER,
        body: "${element.label} survey is waiting for you.",
        title: 'Scheduled Survey Reminder',
        data: <String, Object>{
          "id": element.survey,
        },
      );
      for (int i = 1; i < element.iterations; i++) {
        final ActivityFeed iterationFeed =
            feed.copyWith(id: "SS_${element.label}_${element.role}_$i");
        final bool existingLocalNotification = pendingLocalNotifications.any(
          (PendingNotificationRequest notification) =>
              notification.id == iterationFeed.hashCode,
        );
        if (!existingLocalNotification) {
          LocalNotificationService().scheduleNotificationByWeeks(
            feed: iterationFeed,
            notificationDetails:
                LocalNotificationService().contentNotificationDetails,
            step: element.step * i,
          );
        }
      }
    }
  }

  ///
  Future<void> init() async {
    final Settings settings = await _dataStore.getSettings();

    if (settings == Settings.empty) {
      try {
        if (kDebugMode) {
          print(
            Colorize(
              '[Settings Notifier Provider]: Fetching settings from server.',
            ).blue(),
          );
        }
        final Settings fetchedSettings =
            await _settingsRepository.fetchSettings();
        await _dataStore.writeSettings(fetchedSettings);

        for (final IntroductoryVideo item
            in fetchedSettings.introductoryVideo) {
          if (item.video.url != '') {
            _cacheManager.downloadFile(item.video.url);
          }
        }

        state = fetchedSettings;
      } on SettingsFailure catch (error) {
        if (kDebugMode) {
          print(Colorize(error.toString()).red());
        }
        state = Settings.empty;
      }
    } else {
      if (kDebugMode) {
        print(
          Colorize(
            '[Settings Notifier Provider]: Fetching settings from storage.',
          ).blue(),
        );
      }
      state = settings;
    }
  }
}
