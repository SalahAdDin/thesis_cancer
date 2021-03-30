import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:amplify_flutter/categories/amplify_categories.dart';
import 'package:thesis_cancer/auth/domain/auth.repository.dart';

class AmplifyAuthRepository implements AuthRepository {
  AmplifyAuthRepository({AuthCategory? authCategory})
      : _authCategory = authCategory ?? Amplify.Auth;

  final AuthCategory _authCategory;

  @override
  Future<void> confirmPassword(
      {required String username,
      required String newPassword,
      required String confirmationCode}) async {
    try {
      UpdatePasswordResult result = await _authCategory.confirmPassword(
          username: username,
          newPassword: newPassword,
          confirmationCode: confirmationCode);
    } on AmplifyException catch (error) {
      // TODO: Catch error for analytics, not required for frontend.
    }
  }

  @override
  Future<bool> confirmSignIn({required String confirmationCode}) async {
    try {
      SignInResult result = await _authCategory.confirmSignIn(
          confirmationValue: confirmationCode);
      return result.isSignedIn;
    } on AmplifyException catch (error) {
      // TODO: Catch error for analytics, not required for frontend.
      return false;
    }
  }

  @override
  Future<bool> confirmSignUp(
      {required String username, required String confirmationCode}) async {
    try {
      SignUpResult result = await _authCategory.confirmSignUp(
          username: username, confirmationCode: confirmationCode);
      return result.isSignUpComplete;
    } on AmplifyException catch (error) {
      // TODO: Catch error for analytics, not required for frontend.
      return false;
    }
  }

  @override
  Future<bool> fetchSession() async {
    try {
      AuthSession result = await _authCategory.fetchAuthSession(
          options: CognitoSessionOptions(getAWSCredentials: true));
      return result.isSignedIn;
    } on AmplifyException catch (error) {
      // TODO: Catch error for analytics, not required for frontend.
      return false;
    }
  }

  @override
  Future<List<AuthUserAttribute>>
      fetchUserAttributes<AuthUserAttribute>() async {
    try {
      List<AuthUserAttribute> result =
          await _authCategory.fetchUserAttributes();
      return result;
    } on AmplifyException catch (error) {
      // TODO: Catch error for analytics, not required for frontend.

    }
  }

  @override
  Future<String> getCurrentUser() async {
    try {
      AuthUser result = await _authCategory.getCurrentUser();
      return result.username;
    } on AmplifyException catch (error) {
      // TODO: Catch error for analytics, not required for frontend.

    }
  }

  @override
  Future<bool> isSignedIn() async {
    try {
      AuthSession result = await _authCategory.fetchAuthSession();
      return result.isSignedIn;
    } on AmplifyException catch (error) {
      // TODO: Catch error for analytics, not required for frontend.
      return false;
    }
  }

  @override
  Future<void> resendSignUpCode({required String username}) async {
    try {
      await _authCategory.resendSignUpCode(username: username);
    } on AmplifyException catch (error) {
      // TODO: Catch error for analytics, not required for frontend.
    }
  }

  @override
  Future<bool> resetPassword({required String username}) async {
    try {
      ResetPasswordResult result =
          await _authCategory.resetPassword(username: username);
      return result.isPasswordReset;
    } on AmplifyException catch (error) {
      // TODO: Catch error for analytics, not required for frontend.
      return false;
    }
  }

  @override
  Future<bool> signIn(
      {required String username, required String password}) async {
    try {
      SignInResult result =
          await _authCategory.signIn(username: username, password: password);
      return result.isSignedIn;
    } on AmplifyException catch (error) {
      // TODO: Catch error for analytics, not required for frontend.
      return false;
    }
  }

  @override
  Future<bool> signInWithSocialWebUI<AuthProvider>(
      {required AuthProvider provider}) async {
    try {
      SignInResult result =
          await _authCategory.signInWithWebUI(provider: provider);
      return result.isSignedIn;
    } on AmplifyException catch (error) {
      // TODO: Catch error for analytics, not required for frontend.
      return false;
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _authCategory.signOut();
    } on AmplifyException catch (error) {
      // TODO: Catch error for analytics, not required for frontend.
    }
  }

  // Future<bool> signUp<NamePasswordAmplifyCredential>({required NamePasswordAmplifyCredential authData})

  @override
  Future<bool> signUp(
      {required String username,
      required String password,
      required String emailControllerText}) async {
    try {
      Map<String, String> userAttributes = {"email": emailControllerText};
      SignUpResult result = await _authCategory.signUp(
          username: username,
          password: password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));
      return result.isSignUpComplete;
    } on AmplifyException catch (error) {
      // TODO: Catch error for analytics, not required for frontend.
      return false;
    }
  }

  @override
  Future<void> updatePassword(
      {required String oldPassword, required String newPassword}) async {
    try {
      await _authCategory.updatePassword(
          newPassword: newPassword, oldPassword: oldPassword);
    } on AmplifyException catch (error) {
      // TODO: Catch error for analytics, not required for frontend.
    }
  }
}
