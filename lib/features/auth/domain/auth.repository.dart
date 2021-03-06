abstract class AuthRepository {
/*
  get appleProvider => null;

  get facebookProvider => null;

  get googleProvider => null;

  // TODO: How to handle both success and fail? Maybe in Rescode tutos
  Future<void> confirmPassword(
      {required String username,
      required String newPassword,
      required String confirmationCode});

  Future<dynamic> confirmSignIn({required String confirmationCode});

  Future<bool> confirmSignUp(
      {required String username, required String confirmationCode});

  Future<Map<String, dynamic>> fetchSession();

  Future<Map<String, String>> fetchUserAttributes();

  Future<Map<String, String>> getCurrentUser();

  Future<bool> isSignedIn();

  Future<void> resendSignUpCode({required String username});

  // Future<bool> signInWithSocialWebUI({required provider});

  // Future<void> signOut();

  // Future<void> updatePassword(
      {required String oldPassword, required String newPassword});
*/

  Future<dynamic> resetPassword({
    required String password,
    required String passwordConfirmation,
    required String confirmationCode,
  });

  Future<dynamic> forgotPassword({required String email});

  Future<dynamic> signIn({
    required String identifier,
    required String password,
    String? provider,
  });

  Future<dynamic> signUp({
    required String username,
    required String email,
    required String password,
  });
}
