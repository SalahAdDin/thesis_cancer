import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
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
  DataStoreRepository get _dataStore => reader(dataStoreRepositoryProvider);

  /// User's provider [StateController] to manipulate the current user.
  StateController<User?> get _userController =>
      reader(userEntityProvider.notifier);

  /// Token's [StateController] to manipulate the current auth token.
  StateController<String> get _tokenController =>
      reader(tokenProvider.notifier);

  fb.FirebaseAuth get _auth => reader(firebaseAuthProvider);

  FirebaseAnalytics get _firebaseAnalytics => reader(firebaseAnalyticsProvider);

  @override
  void dispose() {
    // _subscription?.cancel();
    super.dispose();
  }

  /// Obtains the saved user from [Database].
  Future<void> init() async {
    final User profileData = await _dataStore.getUserProfileData();
    // This does mean a dummy user was created.
    if (profileData.email == 'name@dummy.com') {
      print('[Launcher Notifier Provider]: There is no user on storage.');
      state = const LauncherState.needsProfile();
    } else {
      // Updates the current user.
      _userController.state = profileData;
      // Updates the current auth token.
      _tokenController.state = profileData.token!;
      print('[Launcher Notifier Provider]: Loading user from storage.');
      state = const LauncherState.profileLoaded();
    }
  }

  /// Close the user's session by cleaning [tokenProvider], [userEntityProvider],
  /// [Database] and setting [LauncherState.needsProfile] as [LauncherState].
  Future<void> signOut() async {
    state = const LauncherState.needsProfile();
    _tokenController.state = '';
    _userController.state = User.empty;
    await _dataStore.removeUserProfile();
    _firebaseAnalytics.logEvent(name: "logout");
    _auth.signOut();
  }

  /// Re-render the application based on [User] is fetched and persisted on local storage,
  /// the application needs to render the [MainScreen].
  Future<void> singIn() async {
    state = const LauncherState.profileLoaded();
  }
}
