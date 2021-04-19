import 'package:amplify_auth_plugin_interface/src/Exceptions/InvalidPasswordException.dart';
import 'package:amplify_auth_plugin_interface/src/Exceptions/UserNotConfirmedException.dart';
import 'package:amplify_flutter/amplify.dart';

class SignUpFailure implements Exception {
  SignUpFailure(AmplifyException error);
}

class SignUpWithInvalidPasswordFailure implements Exception {
  SignUpWithInvalidPasswordFailure(InvalidPasswordException error);
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

class LogInUnconfirmedUserFailure implements Exception {
  LogInUnconfirmedUserFailure(UserNotConfirmedException error);
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
