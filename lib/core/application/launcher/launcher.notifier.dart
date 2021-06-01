import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.state.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

class LauncherNotifier extends StateNotifier<LauncherState> {
  LauncherNotifier({
    required this.dataStore,
    required this.userController,
  }) : super(const LauncherState.loading()) {
    init();
  }

  final DataStoreRepository dataStore;
  StreamSubscription? _subscription;
  final StateController<User?> userController;

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  void init() async {
    final User profileData = await dataStore.getUserProfileData();
    // This does mean a dummy user was created.
    if (profileData.email == 'name@dummy.com') {
      state = const LauncherState.needsProfile();
    } else {
      userController.state = profileData;
      state = const LauncherState.profileLoaded();
    }
  }
}
