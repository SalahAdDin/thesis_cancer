import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sembast/sembast.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.state.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/features/auth/application/auth.provider.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

/// Launch Notifier
/// Handles business logic related to the application launch.
class LauncherNotifier extends StateNotifier<LauncherState> {
  /// Notifier constructor
  /// Receives a [Reader] from which notifier will get all dependencies.
  /// Throws the initialization function.
  LauncherNotifier({
    required this.reader,
  }) : super(const LauncherState.loading()) {
    init();
  }

  /// [Reader] provider reader.
  final Reader reader;

  // StreamSubscription? _subscription;

  /// [DataStoreRepository] to read the application's storage.
  DataStoreRepository get dataStore => reader(dataStoreRepositoryProvider);

  // TODO: should this to watch the user controller?
  /// User's provider [StateController] to manipulate the current user.
  StateController<User?> get userController =>
      reader(userEntityProvider.notifier);

  /// Token's [StateController] to manipulate the current auth token.
  StateController<String> get tokenController => reader(tokenProvider.notifier);

  @override
  void dispose() {
    // _subscription?.cancel();
    super.dispose();
  }

  /// Obtains the saved user from [Database].
  Future<void> init() async {
    final User profileData = await dataStore.getUserProfileData();
    // This does mean a dummy user was created.
    if (profileData.email == 'name@dummy.com') {
      state = const LauncherState.needsProfile();
    } else {
      // Updates the current user.
      userController.state = profileData;
      // Updates the current auth token.
      tokenController.state = profileData.token!;
      state = const LauncherState.profileLoaded();
    }
  }
}
