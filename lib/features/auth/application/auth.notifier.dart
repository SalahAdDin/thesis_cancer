import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/domain/datastore.repository.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/features/auth/application/auth.state.dart';
import 'package:thesis_cancer/features/auth/domain/auth.repository.dart';
import 'package:thesis_cancer/features/auth/infrastructure/failure.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:uuid/uuid.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier(
      {required this.authRepository,
      required this.dataStore,
      required this.userController,
      required this.tokenController})
      : super(const AuthState.loading());

  var uuid = Uuid();

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
      Map<String, dynamic> result = await authRepository.signUp(
          username: username.split("@")[0],
          email: username,
          password: password);
      User newUser = User(
          id: uuid.v4(),
          email: result['user']['email']!,
          username: result['user']['username'],
          role: UserRole.GUEST,
          confirmed: false);
      userController.state = newUser;
      state = AuthState.signedUp(newUser);
    } on SignUpFailure catch (error) {
      // state = AuthState.error(error.toString());
      return error.toString();
    }
    /*on SignUpFailure catch (error) {
      // state = AuthState.error(error.toString());
      return error.toString();
    }*/
  }

  Future<String?> signIn(
      {required String username, required String password}) async {
    /*try {
      User storedUser = await dataStore.getUserProfileData();
      AmplifyResult result =
          await authRepository.signIn(password: password, identifier: username);
      if (result.isSuccess)
        await createUserProfile(storedUser);
      else if (result.nextStep ==
          EnumToString.convertToString(
              NextStep.CONFIRM_SIGN_IN_WITH_NEW_PASSWORD))
        state = AuthState.requiresConfirmSignIn();
      else
        // state = AuthState.error('It was not possible to log in with your credentials.');
        return 'It was not possible to log in with your credentials.';
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
      // state = AuthState.error(error.toString());
      return error.toString();
    }*/

    throw UnimplementedError();
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

  Future<String?> recoverPassword({required String username}) async {
/*    try {
      bool result = await authRepository.resetPassword(username: username);
      if (result)
        state = AuthState.requestedResetPassword();
      else
        //state = AuthState.error('It was not possible to send a reset password request.');
        return 'It was not possible to send a reset password request.';
    } on ResetPasswordFailure catch (error) {
      // state = AuthState.error(error.toString());
      return error.toString();
    }*/

    throw UnimplementedError();
  }

  Future<void> confirmSignIn({required String confirmationCode}) async {
    /*try {
      User storedUser = await dataStore.getUserProfileData();
      AmplifyResult result = await authRepository.confirmSignIn(
          confirmationCode: confirmationCode);
      if (result.isSuccess && storedUser == User.empty)
        // As this function can be called for both confirm the
        // first login(by changing the password) and for each sign in,
        // we check first login to create a new profile.
        createUserProfile(storedUser);
      else
        state = AuthState.error('It is not possible to confirm your password.');
      // return 'It is not possible to confirm your password.';
    } on ConfirmSignInFailure catch (error) {
      state = AuthState.error(error.toString());
      // return error.toString();
    }*/

    throw UnimplementedError();
  }
}
