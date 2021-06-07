import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.state.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/features/auth/application/auth.provider.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

class LauncherNotifier extends StateNotifier<LauncherState> {
  LauncherNotifier({
    required this.reader,
  }) : super(const LauncherState.loading()) {
    init();
  }

  final Reader reader;

  StreamSubscription? _subscription;

  DataStoreRepository get dataStore => reader(dataStoreRepositoryProvider);

  StateController<User?> get userController =>
      reader(userEntityProvider.notifier);

  StateController<String> get tokenController => reader(tokenProvider.notifier);

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
      tokenController.state = profileData.token!;
      state = const LauncherState.profileLoaded();
    }
  }
}
