abstract class AuthRepository {
  get appleProvider => null;

  get facebookProvider => null;

  get googleProvider => null;

  // TODO: How to handle both success and fail? Maybe in Rescode tutos
  Future<void> confirmPassword(
      {required String username,
      required String newPassword,
      required String confirmationCode});

  Future<bool> confirmSignIn({required String confirmationCode});

  Future<bool> confirmSignUp(
      {required String username, required String confirmationCode});

  Future<bool> fetchSession();

  Future<List<T>> fetchUserAttributes<T>();

  Future<String> getCurrentUser();

  Future<bool> isSignedIn();

  Future<void> resendSignUpCode({required String username});

  Future<bool> resetPassword({required String username});

  // Future<bool> signIn<T>({required T authData});
  Future<bool> signIn({required String username, required String password});

  Future<bool> signInWithSocialWebUI({required provider});

  Future<void> signOut();

  Future<bool> signUp(
      {required String username,
      required String password,
      required String emailControllerText});

  Future<void> updatePassword(
      {required String oldPassword, required String newPassword});
}
