import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.notifier.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.state.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/features/auth/application/auth.provider.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';

final darkThemeProvider = Provider<bool>((ref) => true);

final navigator = Provider((_) => GlobalKey<NavigatorState>());

final packageInfoProvider = FutureProvider<PackageInfo>(
    (_) async => await PackageInfo.fromPlatform(),
    name: "Package Info Provider");

final graphQLClientProvider = Provider<GraphQLClient>((ref) {
  final _httpLink = HttpLink(
    // String.fromEnvironment('API_URL'),
    'http://192.168.1.37:1337/graphql',
  );

  String token = ref.watch(tokenProvider).state;

  print(token);

  final _authLink = AuthLink(
    getToken: () async => 'Bearer $token',
  );

  Link _link = _authLink.concat(_httpLink);

  return GraphQLClient(
    /// **NOTE** The default store is the InMemoryStore, which does NOT persist to disk
    cache: GraphQLCache(),
    link: token != '' ? _link : _httpLink,
  );
}, name: "GraphQL Client Provider");

final dataStoreRepositoryProvider =
    Provider<DataStoreRepository>((ref) => throw UnimplementedError());

final launcherProvider =
    StateNotifierProvider<LauncherNotifier, LauncherState>((ref) {
  final dataStore = ref.watch(dataStoreRepositoryProvider);
  return LauncherNotifier(
      dataStore: dataStore,
      userController: ref.watch(userEntityProvider.notifier));
}, name: 'Launcher Provider');
