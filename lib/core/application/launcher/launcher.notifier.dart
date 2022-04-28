import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:colorize/colorize.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sembast/sembast.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.state.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/features/auth/application/auth.provider.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/features/user/domain/profile.repository.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/infrastructure/failure.dart';

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

  DataStoreRepository get _dataStore => reader(dataStoreRepositoryProvider);

  ProfileRepository get _profileRepository => reader(profileRepositoryProvider);

  fb.FirebaseAuth get _firebaseAuth => reader(firebaseAuthProvider);

  FirebaseAnalytics get _firebaseAnalytics => reader(firebaseAnalyticsProvider);

  FirebaseMessaging get _firebaseMessaging =>
      reader(firebaseMessagingInstanceProvider);

  /// User's provider [StateController] to manipulate the current user.
  StateController<User?> get _userController =>
      reader(userEntityProvider.notifier);

  /// Token's [StateController] to manipulate the current auth token.
  StateController<String> get _tokenController =>
      reader(tokenProvider.notifier);

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
      if (kDebugMode) {
        print(
          Colorize('[Launcher Notifier Provider]: There is no user on storage.')
              .blue(),
        );
      }
      state = const LauncherState.needsProfile();
    } else {
      // Updates the current user.
      _userController.state = profileData;
      // Updates the current auth token.
      _tokenController.state = profileData.token!;
      if (kDebugMode) {
        print(
          Colorize('[Launcher Notifier Provider]: Loading user from storage.')
              .blue(),
        );
      }
      state = const LauncherState.profileLoaded();
    }
  }

  /// Close the user's session by cleaning [tokenProvider], [userEntityProvider],
  /// [Database] and setting [LauncherState.needsProfile] as [LauncherState].
  Future<void> signOut() async {
    state = const LauncherState.needsProfile();

    await _firebaseMessaging.unsubscribeFromTopic('posts');
    await _firebaseMessaging.unsubscribeFromTopic('settings');
    await _firebaseMessaging.unsubscribeFromTopic('surveys');
    await _firebaseMessaging.unsubscribeFromTopic('admins');

    await _firebaseMessaging.deleteToken();

    _tokenController.state = '';
    _userController.state = User.empty;

    await _dataStore.removeUserProfile();

    _firebaseAnalytics.logEvent(name: "logout");
    _firebaseAuth.signOut();
  }

  /// Re-render the application based on [User] is fetched and persisted on local storage,
  /// the application needs to render the [MainScreen].
  Future<void> singIn() async {
    try {
      final User? currentUser = _userController.state;

      await _firebaseMessaging.subscribeToTopic('posts');
      await _firebaseMessaging.subscribeToTopic('settings');
      await _firebaseMessaging.subscribeToTopic('surveys');

      final String? token = await _firebaseMessaging.getToken();

      final Profile updatedProfile = await _profileRepository.updateProfile(
        updatedProfile: currentUser!.profile!.copyWith(
          token: token,
        ),
      );

      final User updatedUser = currentUser.copyWith(profile: updatedProfile);

      await _dataStore.writeUserProfile(updatedUser);

      _userController.state = updatedUser;

      state = const LauncherState.profileLoaded();
    } on ProfileFailure catch (error) {
      if (kDebugMode) {
        print(
          Colorize("Error Updating Profile at Sign In: ${error.reason}").red(),
        );
      }
    } on FirebaseException catch (error) {
      if (kDebugMode) {
        print(
          Colorize("Error getting device token: $error").red(),
        );
      }
    }
  }
}
