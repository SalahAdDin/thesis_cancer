import 'package:flutter/widgets.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.notifier.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.state.dart';
import 'package:thesis_cancer/core/application/local_notification_service.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/domain/settings/schedules.entity.dart';
import 'package:thesis_cancer/core/domain/settings/settings.entity.dart';
import 'package:thesis_cancer/core/domain/settings/settings.repository.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/infrastructure/settings.repository.dart';
import 'package:thesis_cancer/features/auth/application/auth.provider.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';

/// Package Info Provider
/// Provides basic information [PackageInfo] about our application.
final FutureProvider<PackageInfo> packageInfoProvider =
    FutureProvider<PackageInfo>(
  (_) async => PackageInfo.fromPlatform(),
  name: "Package Info Provider",
);

/// GraphQL Client Provider
/// Provides a [GraphQLClient] with/without an authentication token.
final Provider<GraphQLClient> graphQLClientProvider =
    Provider<GraphQLClient>((ProviderReference ref) {
  final HttpLink _httpLink = HttpLink(
    // String.fromEnvironment('API_URL'),
    'http://192.168.1.36:1337/graphql',
  );

  final String token = ref.watch(tokenProvider).state;

  final AuthLink _authLink = AuthLink(
    getToken: () async => 'Bearer $token',
  );

  final Link _link = _authLink.concat(_httpLink);

  return GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: token != '' ? _link : _httpLink,
  );
}, name: "GraphQL Client Provider");

/// Data Store Provider
/// Throws an error as we don't want to provide any repository till
/// the database [SembastDataStore] is initialized.
final Provider<DataStoreRepository> dataStoreRepositoryProvider =
    Provider<DataStoreRepository>(
  (ProviderReference ref) => throw UnimplementedError(),
  name: 'Data Store Provider',
);

///
final Provider<SettingsRepository> settingsRepositoryProvider =
    Provider<SettingsRepository>(
  (ProviderReference ref) => GraphQLSettingsRepository(reader: ref.read),
  name: 'Settings Repository Provider',
);

// TODO: May it require a notifier if we need to change local app settings
/// Settings Provider
/// It fetch the settings from datastore and
/// - Returns the current settings if it is not empty.
/// - Fetches the settings from the API, schedules local notifications for
///   scheduled surveys and returns them.
final FutureProvider<Settings> settingsProvider = FutureProvider<Settings>(
  (ProviderReference ref) async {
    final DataStoreRepository dataStore = ref.read(dataStoreRepositoryProvider);
    final SettingsRepository settingsRepository =
        ref.read(settingsRepositoryProvider);

    final Settings settings = await dataStore.getSettings();

    if (settings == Settings.empty) {
      final Map<String, dynamic> result =
          await settingsRepository.fetchSettings() as Map<String, dynamic>;
      final Settings fetchedSettings = Settings.fromJson(result);
      await dataStore.writeSettings(settings);
      // Local notifications will be scheduled at first app launch.
      // At this moment there is no any settings on the storage.
      // TODO: Watch here if the user is logged, don't schedule till the user is logged in.
      if (fetchedSettings.surveySchedules != null &&
          fetchedSettings.surveySchedules!.isNotEmpty) {
        for (final SurveySchedule element in fetchedSettings.surveySchedules!) {
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
      return fetchedSettings;
    } else {
      return settings;
    }
  },
  name: 'Settings Provider',
);

///
final StateNotifierProvider<LauncherNotifier, LauncherState> launcherProvider =
    StateNotifierProvider<LauncherNotifier, LauncherState>(
  (ProviderReference ref) => LauncherNotifier(reader: ref.read),
  name: 'Launcher Notifier Provider',
);
