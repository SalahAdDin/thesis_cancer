import 'package:amplify_flutter/amplify.dart';

class SignUpFailure implements Exception {
  SignUpFailure(AmplifyException error);
}

class ResetPasswordFailure implements Exception {
  ResetPasswordFailure(AmplifyException error);
}

class LogInWithSocialProviderFailure implements Exception {
  LogInWithSocialProviderFailure(AmplifyException error);
}

class LogInWithEmailAndPasswordFailure implements Exception {
  LogInWithEmailAndPasswordFailure(AmplifyException error);
}

class FetchUserAttributesFailure implements Exception {
  FetchUserAttributesFailure(AmplifyException error);
}

class GettingCurrentUserFailure implements Exception {
  GettingCurrentUserFailure(AmplifyException error);
}

class ConfirmSignInFailure implements Exception {
  ConfirmSignInFailure(AmplifyException error);
}
