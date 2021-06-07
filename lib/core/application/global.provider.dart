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
import 'package:thesis_cancer/features/user/application/user.provider.dart';

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
    'http://10.30.30.17:1337/graphql',
  );

  final String token = ref.watch(tokenProvider).state;

  print(token);

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

final graphQLAuthClientProvider = Provider<GraphQLClient>((ref) {
  final _httpLink = HttpLink(
    'http://192.168.1.36:1337/graphql',
  );

  final _authLink = AuthLink(
    getToken: () async =>
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6NDUsImlhdCI6MTYyMjYyNTQ1MiwiZXhwIjoxNjI1MjE3NDUyfQ.zGSa7vqDqfnBpy3d7k-2_jClZsofWgL23abL3jDTq-E',
  );

  final Link _link = _authLink.concat(_httpLink);

  return GraphQLClient(
    cache: GraphQLCache(),
    link: _link,
  );
}, name: "GraphQL Auth Client Provider");

final dataStoreRepositoryProvider = Provider<DataStoreRepository>(
  (ref) => throw UnimplementedError(),
  name: 'Data Store Provider',
);

final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => GraphQLSettingsRepository(client: ref.watch(graphQLClientProvider)),
  name: 'Settings Repository Provider',
);

// TODO: May it require a notifier if we need to change local app settings
final settingsProvider = FutureProvider<Settings>(
  (ref) async {
    final dataStore = ref.watch(dataStoreRepositoryProvider);
    final settingsRepository = ref.watch(settingsRepositoryProvider);

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
  (ref) {
    final dataStore = ref.watch(dataStoreRepositoryProvider);
    return LauncherNotifier(
        dataStore: dataStore,
        userController: ref.watch(userEntityProvider.notifier));
  },
  name: 'Launcher Provider',
);
