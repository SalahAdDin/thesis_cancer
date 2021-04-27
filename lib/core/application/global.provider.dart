import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.notifier.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.state.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';

final darkThemeProvider = Provider<bool>((ref) => true);

final navigator = Provider((_) => GlobalKey<NavigatorState>());

final packageInfoProvider = FutureProvider<PackageInfo>(
    (_) async => await PackageInfo.fromPlatform(),
    name: "Package Info Provider");

final dataStoreRepositoryProvider =
    Provider<DataStoreRepository>((ref) => throw UnimplementedError());

final launcherProvider =
    StateNotifierProvider<LauncherNotifier, LauncherState>((ref) {
  final dataStore = ref.watch(dataStoreRepositoryProvider);
  return LauncherNotifier(
      dataStore: dataStore,
      userController: ref.watch(userEntityProvider.notifier));
}, name: 'Launcher Provider');

// final authRepositoryProvider = Provider<>((ref) {
//     return ;
// });

// final userProfileDataProvider = Provider<User>((ref) {
//   final state= ref.watch(SplashScreenProvider.state)
//     return state.when(loading: () => null, needsProfile: ()=> User());
// });
