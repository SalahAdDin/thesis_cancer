import 'package:thesis_cancer/features/user/domain/user.entity.dart';

/// Authentication Repository Interface
abstract class AuthRepository {
/*
  get appleProvider => null;

  get facebookProvider => null;

  get googleProvider => null;

  // TODO: How to handle both success and fail? Maybe in Rescode tutos
  Future<void> confirmPassword({
      required String username,
      required String newPassword,
      required String confirmationCode,
      });

  Future<dynamic> confirmSignIn({required String confirmationCode});

  Future<bool> confirmSignUp(
      {required String username, required String confirmationCode});

  // Future<void> updatePassword(
      {required String oldPassword, required String newPassword});
*/

  ///
  Future<User> resetPassword({
    required String password,
    required String passwordConfirmation,
    required String confirmationCode,
  });

  ///
  Future<bool> forgotPassword({required String email});

  ///
  Future<User> signIn({
    required String identifier,
    required String password,
    String? provider,
  });

  ///
  Future<User> signUp({
    required String username,
    required String email,
    required String password,
  });
}
