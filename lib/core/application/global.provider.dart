import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info/package_info.dart';
import 'package:thesis_cancer/core/application/splash.notifier.dart';
import 'package:thesis_cancer/core/application/splash.state.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';

final darkThemeProvider = Provider<bool>((ref) => true);

final navigator = Provider((_) => GlobalKey<NavigatorState>());

final packageInfoProvider = FutureProvider<PackageInfo>(
    (_) async => await PackageInfo.fromPlatform(),
    name: "Package Info Provider");

final dataStoreRepositoryProvider =
    Provider<DataStoreRepository>((ref) => throw UnimplementedError());

final splashScreenProvider =
    StateNotifierProvider<SplashScreenNotifier, SplashScreenState>((ref) {
  final dataStore = ref.watch(dataStoreRepositoryProvider);
  return SplashScreenNotifier(dataStore: dataStore);
}, name: 'Splash Screen Provider');

// final authRepositoryProvider = Provider<>((ref) {
//     return ;
// });

// final userProfileDataProvider = Provider<User>((ref) {
//   final state= ref.watch(SplashScreenProvider.state)
//     return state.when(loading: () => null, needsProfile: ()=> User());
// });
