import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/auth/domain/auth.repository.dart';
import 'package:thesis_cancer/auth/domain/auth.state.dart';
import 'package:thesis_cancer/auth/infrastructure/failure.dart';
import 'package:thesis_cancer/auth/infrastructure/utils.dart';
import 'package:thesis_cancer/home/domain/datastore.repository.dart';
import 'package:thesis_cancer/user/domain/user.entity.dart';
import 'package:thesis_cancer/utils/types.dart';
import 'package:uuid/uuid.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier({required this.authRepository, required this.dataStore})
      : super(const AuthState.loading());

  var uuid = Uuid();

  final AuthRepository authRepository;
  final DataStoreRepository dataStore;

  // StreamSubscription? _subscription;

  @override
  void dispose() {
    // _subscription?.cancel();
    super.dispose();
  }

  Future<void> createUserProfile(User storedUser) async {
    final userAttributes = authRepository.fetchUserAttributes();
    /* TODO: Getting user from API by userId or username?
        *   Must the userId from Cognito saved on backend?*/
    // final backendStoredUser = apiRepository.getUserAccount(username: username);
    // TODO: verify which attributes comes: confirmed and roles(groups) are required.
    User newProfile = User(
        id: uuid.v4(),
        email: '',
        displayName: '',
        role: UserRole.PILOT,
        isConfirmed: true);

    // TODO: Ensure every new change on the user profile will be persisted on backend
    if (storedUser == User.empty)
      await dataStore.writeUserProfile(newProfile);
    else if (newProfile == storedUser) {
    } else
      await dataStore.writeUserProfile(newProfile);
    state = AuthState.loggedIn(newProfile);
  }

  Future<void> signOut() async {
    try {
      await authRepository.signOut();
      await dataStore.removeUserProfile();
      state = AuthState.loggedOut();
    } on Exception catch (error) {
      // TODO: Which exception?
      state = AuthState.error(error.toString());
    }
  }

  Future<String?> registerUser({
    required String username,
    required String password,
  }) async {
    try {
      bool result =
          await authRepository.signUp(username: username, password: password);
      if (!result)
        state = AuthState.signedUp(User(
            id: uuid.v4(),
            email: username,
            displayName: username,
            role: UserRole.PILOT));
    } on SignUpFailure catch (error) {
      state = AuthState.error(error.toString());
    }
  }

  Future<String?> signIn(
      {required String username, required String password}) async {
    try {
      User storedUser = await dataStore.getUserProfileData();
      AmplifyResult result =
          await authRepository.signIn(username: username, password: password);
      if (result.isSuccess)
        await createUserProfile(storedUser);
      else if (result.nextStep == 'CONFIRM_SIGN_IN_WITH_NEW_PASSWORD')
        state = AuthState.requiresConfirmSignIn();
      else
        state = AuthState.error(
            'It was not possible to log in with your credentials.');
    } on LogInWithEmailAndPasswordFailure catch (error) {
      state = AuthState.error(error.toString());
    }
  }

  Future<String?> signInWithFacebook() async {
    try {
      bool result = await authRepository.signInWithSocialWebUI(
          provider: authRepository.facebookProvider);
      User storedUser = await dataStore.getUserProfileData();
      if (result) {
        await createUserProfile(storedUser);
      } else {
        state = AuthState.error('It was not possible to log in with Facebook.');
      }
    } on LogInWithSocialProviderFailure catch (error) {
      state = AuthState.error(error.toString());
    }
  }

  Future<String?> signInWithGoogle() async {
    try {
      bool result = await authRepository.signInWithSocialWebUI(
          provider: authRepository.googleProvider);
      User storedUser = await dataStore.getUserProfileData();
      if (result)
        await createUserProfile(storedUser);
      else
        state = AuthState.error('It was not possible to log in with Google.');
    } on LogInWithSocialProviderFailure catch (error) {
      state = AuthState.error(error.toString());
    }
  }

  Future<String?> signInWithApple() async {
    try {
      bool result = await authRepository.signInWithSocialWebUI(
          provider: authRepository.appleProvider);
      User storedUser = await dataStore.getUserProfileData();
      if (result)
        await createUserProfile(storedUser);
      else
        state = AuthState.error('It was not possible to log in with Apple.');
    } on LogInWithSocialProviderFailure catch (error) {
      state = AuthState.error(error.toString());
    }
  }

  Future<String?> recoverPassword({required String username}) async {
    try {
      bool result = await authRepository.resetPassword(username: username);
      if (result)
        state = AuthState.requestedResetPassword();
      else
        state = AuthState.error(
            'It was not possible to send a reset password request.');
    } on ResetPasswordFailure catch (error) {
      state = AuthState.error(error.toString());
    }
  }

  Future<void> confirmSignIn({required String confirmationCode}) async {
    try {
      User storedUser = await dataStore.getUserProfileData();
      AmplifyResult result = await authRepository.confirmSignIn(
          confirmationCode: confirmationCode);
      if (result.isSuccess)
        createUserProfile(storedUser);
      else
        state = AuthState.error('It is not possible to confirm your password.');
    } on ConfirmSignInFailure catch (error) {
      state = AuthState.error(error.toString());
    }
  }
}
