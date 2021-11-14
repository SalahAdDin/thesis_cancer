import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/features/auth/application/auth.provider.dart';
import 'package:thesis_cancer/features/auth/application/auth.state.dart';
import 'package:thesis_cancer/features/auth/domain/auth.repository.dart';
import 'package:thesis_cancer/features/auth/infrastructure/failure.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

///
class AuthNotifier extends StateNotifier<AuthState> {
  ///
  AuthNotifier({required this.reader}) : super(const AuthState.loading());

  /// [Reader] provider reader.
  final Reader reader;

  AuthRepository get _authRepository => reader(authRepositoryProvider);

  DataStoreRepository get _dataStore => reader(dataStoreRepositoryProvider);

  StateController<User?> get _userController =>
      reader(userEntityProvider.notifier);

  StateController<String> get _tokenController =>
      reader(tokenProvider.notifier);

  fb.FirebaseAuth get _fireBaseAuth => reader(firebaseAuthProvider);

  FirebaseAnalytics get _firebaseAnalytics => reader(firebaseAnalyticsProvider);

  // StreamSubscription? _subscription;

  @override
  void dispose() {
    // _subscription?.cancel();
    super.dispose();
  }

  ///
  Future<void> registerUser({
    required String username,
    required String password,
  }) async {
    try {
      final User newUser = await _authRepository.signUp(
        username: username.split("@")[0],
        email: username,
        password: password,
      );
      final fb.UserCredential credentials =
          await _fireBaseAuth.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );
      await _firebaseAnalytics.setUserId(credentials.user?.uid);
      await _firebaseAnalytics.setUserProperty(
        name: 'backend_user_id',
        value: _userController.state!.id,
      );
      await _firebaseAnalytics.logSignUp(signUpMethod: "email");
      _userController.state = newUser.copyWith(confirmed: false);
      state = const AuthState.signedUp();
    } on SignUpFailure catch (_) {
      rethrow;
    }
    /*
    on SignUpFailure catch (_) {
      // state = AuthState.error(error.toString());
      return error.toString();
    }
    */
  }

  ///
  Future<void> signIn({
    required String username,
    required String password,
  }) async {
    try {
      User sessionUser = await _authRepository.signIn(
        identifier: username,
        password: password,
      );
      if (sessionUser.confirmed != false) {
        final fb.UserCredential credentials =
            await _fireBaseAuth.signInWithEmailAndPassword(
          email: username,
          password: password,
        );
        sessionUser = sessionUser.copyWith(
          profile: Profile.empty.copyWith(uid: credentials.user?.uid),
        );
        _tokenController.state = sessionUser.token!;
      }
      await _firebaseAnalytics.logLogin(loginMethod: 'email/password');
      await _dataStore.writeUserProfile(sessionUser);
      _userController.state = sessionUser;
      state = const AuthState.loggedIn();
    } on LogInFailure catch (_) {
      // state = AuthState.error(error.toString());
      // return "E-posta veya şifre geçersiz.";
      rethrow;
    }
    /*
    try {
    } on LogInUnconfirmedUserFailure {
      User newProfile = User(
          id: uuid.v4(),
          email: username,
          username: '',
          role: UserRole.GUEST,
          confirmed: false);
      this.userController.state = newProfile;
      state = AuthState.loggedIn(newProfile);
    } on LogInWithEmailAndPasswordFailure catch (_) {
    }
    */
  }

  ///
  Future<void> signInWithFacebook() async {
    /*
    try {
      bool result = await authRepository.signInWithSocialWebUI(
          provider: authRepository.facebookProvider);
      User storedUser = await dataStore.getUserProfileData();
      if (result) {
        await createUserProfile(storedUser);
      } else {
        // state = AuthState.error('It was not possible to log in with Facebook.');
        return 'It was not possible to log in with Facebook.';
      }
    } on LogInWithSocialProviderFailure catch (_) {
      // state = AuthState.error(error.toString());
      return error.toString();
    }
    */

    throw UnimplementedError();
  }

  ///
  Future<void> signInWithGoogle() async {
    /*try {
      bool result = await authRepository.signInWithSocialWebUI(
          provider: authRepository.googleProvider);
      User storedUser = await dataStore.getUserProfileData();
      if (result)
        await createUserProfile(storedUser);
      else
        // state = AuthState.error('It was not possible to log in with Google.');
        return 'It was not possible to log in with Google.';
    } on LogInWithSocialProviderFailure catch (_) {
      // state = AuthState.error(error.toString());
      return error.toString();
    }*/

    throw UnimplementedError();
  }

  ///
  Future<void> signInWithApple() async {
/*    try {
      bool result = await authRepository.signInWithSocialWebUI(
          provider: authRepository.appleProvider);
      User storedUser = await dataStore.getUserProfileData();
      if (result)
        await createUserProfile(storedUser);
      else
        // state = AuthState.error('It was not possible to log in with Apple.');
        return 'It was not possible to log in with Apple.';
    } on LogInWithSocialProviderFailure catch (_) {
      // state = AuthState.error(error.toString());
      return error.toString();
    }*/

    throw UnimplementedError();
  }

  ///
  Future<void> requestPasswordRecovery({required String email}) async {
    try {
      final bool isRequested = await _authRepository.forgotPassword(
        email: email,
      );
      if (!isRequested) {
        throw ForgotPasswordFailure(
          reason: ForgotPasswordFailureReason.unknown,
        );
      }
    } on ForgotPasswordFailure catch (_) {
      rethrow;
    }
  }

  ///
  Future<void> recoverPassword({
    required String password,
    required String passwordConfirmation,
    required String confirmationCode,
  }) async {
    try {
      final User sessionUser = await _authRepository.resetPassword(
        password: password,
        passwordConfirmation: passwordConfirmation,
        confirmationCode: confirmationCode,
      );
      // TODO: Redirect to login page again as with logout.
      // state = const AuthState.loggedOut();
    } on ResetPasswordFailure catch (_) {
      rethrow;
    }
  }
}
