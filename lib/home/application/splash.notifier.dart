import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/home/domain/datastore.repository.dart';
import 'package:thesis_cancer/home/domain/splash.state.dart';

class SplashScreenNotifier extends StateNotifier<SplashScreenState> {
  SplashScreenNotifier({required this.dataStore})
      : super(const SplashScreenState.loading()) {
    init();
  }

  final DataStoreRepository dataStore;
  StreamSubscription? _subscription;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void init() {
    _subscription = dataStore.userProfileData().listen((profileData) {
      // This does mean a dummy user was created.
      if (profileData.email == '')
        state = SplashScreenState.needsProfile();
      else
        state = SplashScreenState.profileLoaded(profileData);
    });
  }
}
