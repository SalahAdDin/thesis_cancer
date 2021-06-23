import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.notifier.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.state.dart';
import 'package:thesis_cancer/core/application/settings.notifier.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/domain/settings/settings.entity.dart';
import 'package:thesis_cancer/core/domain/settings/settings.repository.dart';
import 'package:thesis_cancer/core/infrastructure/settings.repository.dart';
import 'package:thesis_cancer/features/auth/application/auth.provider.dart';

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
  // String.fromEnvironment('API_URL'),
  const String graphQLEndpoint = 'http://10.30.30.176:1337/graphql';
  // const String graphQLEndpoint = 'http://172.16.0.111:1337/graphql';
  // const String subscriptionEndpoint = "ws://10.30.30.176:3000/subscription";
  final HttpLink _httpLink = HttpLink(
    graphQLEndpoint,
  );

  final String token = ref.watch(tokenProvider).state;

  final AuthLink _authLink = AuthLink(
    getToken: () async => 'Bearer $token',
  );

  Link _link = _authLink.concat(_httpLink);

  /*
  if (subscriptionEndpoint != null) {
    final WebSocketLink _wsLink = WebSocketLink(subscriptionEndpoint);
    _link =
        Link.split((Request request) => request.isSubscription, _wsLink, _link);
  }
  */

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
/// - Downloads the introductory video to cache.
final StateNotifierProvider<SettingsNotifier, Settings>
    settingsNotifierProvider =
    StateNotifierProvider<SettingsNotifier, Settings>(
  (ProviderReference ref) => SettingsNotifier(reader: ref.read)..init(),
  name: "Settings Notifier Provider",
);

///
final StateNotifierProvider<LauncherNotifier, LauncherState> launcherProvider =
    StateNotifierProvider<LauncherNotifier, LauncherState>(
  (ProviderReference ref) => LauncherNotifier(reader: ref.read),
  name: 'Launcher Notifier Provider',
);
