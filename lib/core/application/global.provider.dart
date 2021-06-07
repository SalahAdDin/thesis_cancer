import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.notifier.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.state.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/domain/settings/settings.entity.dart';
import 'package:thesis_cancer/core/domain/settings/settings.repository.dart';
import 'package:thesis_cancer/core/infrastructure/settings.repository.dart';
import 'package:thesis_cancer/features/auth/application/auth.provider.dart';

/*
final navigatorProvider =
    Provider((_) => GlobalKey<NavigatorState>(), name: "Navigator Provider");
*/

final packageInfoProvider = FutureProvider<PackageInfo>(
  (_) async => await PackageInfo.fromPlatform(),
  name: "Package Info Provider",
);

final graphQLClientProvider = Provider<GraphQLClient>((ref) {
  final _httpLink = HttpLink(
    // String.fromEnvironment('API_URL'),
    'http://192.168.1.36:1337/graphql',
  );

  final String token = ref.watch(tokenProvider).state;

  final _authLink = AuthLink(
    getToken: () async => 'Bearer $token',
  );

  final Link _link = _authLink.concat(_httpLink);

  return GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: token != '' ? _link : _httpLink,
  );
}, name: "GraphQL Client Provider");

final dataStoreRepositoryProvider = Provider<DataStoreRepository>(
  (ref) => throw UnimplementedError(),
  name: 'Data Store Provider',
);

final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => GraphQLSettingsRepository(reader: ref.read),
  name: 'Settings Repository Provider',
);

// TODO: May it require a notifier if we need to change local app settings
final settingsProvider = FutureProvider<Settings>(
  (ref) async {
    final dataStore = ref.read(dataStoreRepositoryProvider);
    final settingsRepository = ref.read(settingsRepositoryProvider);

    final Settings settings = await dataStore.getSettings();

    if (settings == Settings.empty) {
      final Map<String, dynamic> result =
          await settingsRepository.fetchSettings() as Map<String, dynamic>;
      final Settings fetchedSettings = Settings.fromJson(result);
      await dataStore.writeSettings(settings);
      return fetchedSettings;
    } else {
      return settings;
    }
  },
  name: 'Settings Provider',
);

final launcherProvider = StateNotifierProvider<LauncherNotifier, LauncherState>(
  (ref) => LauncherNotifier(reader: ref.read),
  name: 'Launcher Provider',
);
