import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart' as fb;
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/features/auth/application/auth.provider.dart';
import 'package:thesis_cancer/features/auth/application/auth.state.dart';
import 'package:thesis_cancer/features/auth/application/helpers.dart';
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

  // StreamSubscription? _subscription;

  @override
  void dispose() {
    // _subscription?.cancel();
    super.dispose();
  }

  ///
  Future<String?> registerUser({
    required String username,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> result = await _authRepository.signUp(
        username: username.split("@")[0],
        email: username,
        password: password,
      ) as Map<String, dynamic>;
      await _fireBaseAuth.createUserWithEmailAndPassword(
        email: username,
        password: password,
      );
      final User newUser = User.fromJson(result);
      _userController.state = newUser.copyWith(confirmed: false);
      state = const AuthState.signedUp();
    } on SignUpFailure catch (error) {
      // state = AuthState.error(error.toString());
      return localizeAuthFailures(error.reason);
    }
    /*on SignUpFailure catch (error) {
      // state = AuthState.error(error.toString());
      return error.toString();
    }*/
  }

  ///
  Future<String?> signIn({
    required String username,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> rawUser = await _authRepository.signIn(
        identifier: username,
        password: password,
      ) as Map<String, dynamic>;
      User sessionUser = User.fromJson(rawUser);
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
      await _dataStore.writeUserProfile(sessionUser);
      _userController.state = sessionUser;
      state = const AuthState.loggedIn();
    } on LogInFailure catch (error) {
      // state = AuthState.error(error.toString());
      // return "E-posta veya şifre geçersiz.";
      return localizeAuthFailures(error.reason);
    }
    /*try {
    } on LogInUnconfirmedUserFailure {
      User newProfile = User(
          id: uuid.v4(),
          email: username,
          username: '',
          role: UserRole.GUEST,
          confirmed: false);
      this.userController.state = newProfile;
      state = AuthState.loggedIn(newProfile);
    } on LogInWithEmailAndPasswordFailure catch (error) {
    }*/
  }

  ///
  Future<String?> signInWithFacebook() async {
    /*try {
      bool result = await authRepository.signInWithSocialWebUI(
          provider: authRepository.facebookProvider);
      User storedUser = await dataStore.getUserProfileData();
      if (result) {
        await createUserProfile(storedUser);
      } else {
        // state = AuthState.error('It was not possible to log in with Facebook.');
        return 'It was not possible to log in with Facebook.';
      }
    } on LogInWithSocialProviderFailure catch (error) {
      // state = AuthState.error(error.toString());
      return error.toString();
    }*/

    throw UnimplementedError();
  }

  ///
  Future<String?> signInWithGoogle() async {
    /*try {
      bool result = await authRepository.signInWithSocialWebUI(
          provider: authRepository.googleProvider);
      User storedUser = await dataStore.getUserProfileData();
      if (result)
        await createUserProfile(storedUser);
      else
        // state = AuthState.error('It was not possible to log in with Google.');
        return 'It was not possible to log in with Google.';
    } on LogInWithSocialProviderFailure catch (error) {
      // state = AuthState.error(error.toString());
      return error.toString();
    }*/

    throw UnimplementedError();
  }

  ///
  Future<String?> signInWithApple() async {
/*    try {
      bool result = await authRepository.signInWithSocialWebUI(
          provider: authRepository.appleProvider);
      User storedUser = await dataStore.getUserProfileData();
      if (result)
        await createUserProfile(storedUser);
      else
        // state = AuthState.error('It was not possible to log in with Apple.');
        return 'It was not possible to log in with Apple.';
    } on LogInWithSocialProviderFailure catch (error) {
      // state = AuthState.error(error.toString());
      return error.toString();
    }*/

    throw UnimplementedError();
  }

  ///
  Future<String?> requestPasswordRecovery({required String email}) async {
    try {
      final bool isRequested = await _authRepository.forgotPassword(
        email: email,
      ) as bool;
      if (isRequested) {
        state = const AuthState.resetPassword();
      } else {
        return 'Şifrenizi sıfırlamanız istenirken bir hata oluştu.';
      }
    } on ForgotPasswordFailure catch (error) {
      return localizeAuthFailures(error.reason);
    }
  }

  ///
  Future<String?> recoverPassword({
    required String password,
    required String passwordConfirmation,
    required String confirmationCode,
  }) async {
    try {
      final Map<String, dynamic> rawUser = await _authRepository.resetPassword(
        password: password,
        passwordConfirmation: passwordConfirmation,
        confirmationCode: confirmationCode,
      ) as Map<String, dynamic>;
      final User sessionUser = User.fromJson(rawUser);
      // TODO: Redirect to login page again as with logout.
      // state = const AuthState.loggedOut();
    } on ResetPasswordFailure catch (error) {
      // state = AuthState.error(error.toString());
      return localizeAuthFailures(error.reason);
    }
  }
}
