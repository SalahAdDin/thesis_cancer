import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/features/auth/application/auth.state.dart';
import 'package:thesis_cancer/features/auth/domain/auth.repository.dart';
import 'package:thesis_cancer/features/auth/infrastructure/failure.dart';
import 'package:thesis_cancer/features/user/domain/profile.entity.dart';
import 'package:thesis_cancer/features/user/domain/profile.repository.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(
      {required this.authRepository,
      required this.profileRepository,
      required this.dataStore,
      required this.userController,
      required this.tokenController})
      : super(const AuthState.loading());

  final ProfileRepository profileRepository;
  final AuthRepository authRepository;
  final DataStoreRepository dataStore;
  final StateController<User?> userController;
  final StateController<String> tokenController;

  // StreamSubscription? _subscription;

  @override
  void dispose() {
    // _subscription?.cancel();
    super.dispose();
  }

  /*
  Future<void> createUserProfile(User storedUser) async {
    Map<String, String> userAttributes =
        await authRepository.fetchUserAttributes();
    */ /* TODO: Getting user from API by userId or username?
        *   Must the userId from Cognito saved on backend?
        * */ /*
    // final backendStoredUser = apiRepository.getUserAccount(username: username);
    Map<String, dynamic> userSession = await authRepository.fetchSession();
    // TODO: what if userSession['roles'][0] does not exist?
    String? userSessionRole = userSession['roles'][0];
    User newProfile = User(
        id: uuid.v4(),
        email: userAttributes['email']!,
        username: '',
        phoneNumber: userAttributes['phone_number']!,
        role: userSessionRole != null
            ? EnumToString.fromString(
                UserRole.values, userSessionRole.toUpperCase())!
            : UserRole.GUEST,
        confirmed: userAttributes['email_verified'] == 'true' ||
                userAttributes['phone_number_verified'] == 'true'
            ? true
            : false);
    // TODO: Ensure every new change on the user profile will be persisted on backend
    // TODO: call to API
    if (newProfile == storedUser) {
//      state = AuthState.loggedIn(loggedInUser);
    } else
      // TODO: at writing on dataStore, SplashScreen stream is triggered and its
      //  state change to Profile, which send us to the screen and break all.
      await dataStore.writeUserProfile(newProfile);
    this.userController.state = newProfile;
    state = AuthState.loggedIn(newProfile);
  }*/

  Future<String?> signOut() async {
    try {
      tokenController.state = '';
      await dataStore.removeUserProfile();
      state = const AuthState.loggedOut();
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
      final Map<String, dynamic> result = await authRepository.signUp(
          username: username.split("@")[0],
          email: username,
          password: password) as Map<String, dynamic>;
      final User newUser = User.fromJson(result);
      userController.state = newUser.copyWith(confirmed: false);
      state = const AuthState.signedUp();
    } on SignUpFailure catch (error) {
      // state = AuthState.error(error.toString());
      return error.toString();
    }
    /*on SignUpFailure catch (error) {
      // state = AuthState.error(error.toString());
      return error.toString();
    }*/
  }

  Future<String?> signIn({
    required String username,
    required String password,
  }) async {
    try {
      final Map<String, dynamic> rawUser = await authRepository.signIn(
          identifier: username, password: password) as Map<String, dynamic>;
      final User sessionUser = User.fromJson(rawUser);
      if (sessionUser.confirmed != false) {
        // tokenController.state = sessionUser.token!;
      }
      await dataStore.writeUserProfile(sessionUser);
      userController.state = sessionUser;
      state = const AuthState.loggedIn();
    } on LogInFailureByBadRequest {
      return "E-posta veya ??ifre ge??ersiz.";
    } on LogInFailure catch (error) {
      // state = AuthState.error(error.toString());
      return error.toString();
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

  Future<String?> requestPasswordRecovery({required String email}) async {
    try {
      final bool isRequested =
          await authRepository.forgotPassword(email: email) as bool;
      if (isRequested) {
        state = const AuthState.resetPassword();
      } else {
        return '??ifrenizi s??f??rlaman??z istenirken bir hata olu??tu.';
      }
    } on ForgotPasswordFailure catch (error) {
      return error.toString();
    }
  }

  Future<String?> recoverPassword({
    required String password,
    required String passwordConfirmation,
    required String confirmationCode,
  }) async {
    try {
      final Map<String, dynamic> rawUser = await authRepository.resetPassword(
          password: password,
          passwordConfirmation: passwordConfirmation,
          confirmationCode: confirmationCode) as Map<String, dynamic>;
      final User sessionUser = User.fromJson(rawUser);
      // TODO: Redirect to login page again as with logout.
      state = const AuthState.loggedOut();
    } on ResetPasswordFailure catch (error) {
      // state = AuthState.error(error.toString());
      return error.toString();
    }
  }
}
