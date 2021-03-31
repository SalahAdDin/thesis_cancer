import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/home/application/splash.notifier.dart';
import 'package:thesis_cancer/home/domain/datastore.repository.dart';
import 'package:thesis_cancer/user/domain/user.entity.dart';

final darkThemeProvider = Provider<bool>((ref) => true);

final dataStoreRepositoryProvider =
    Provider<DataStoreRepository>((ref) => throw UnimplementedError());

final splashScreenProvider = StateNotifierProvider<SplashScreenNotifier>((ref) {
  final dataStore = ref.watch(dataStoreRepositoryProvider);
  return SplashScreenNotifier(dataStore: dataStore);
});

// final authRepositoryProvider = Provider<>((ref) {
//     return ;
// });

// final userProfileDataProvider = Provider<User>((ref) {
//   final state= ref.watch(SplashScreenProvider.state)
//     return state.when(loading: () => null, needsProfile: ()=> User());
// });
