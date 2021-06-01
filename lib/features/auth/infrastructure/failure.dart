// TODO: We need to pass the message itself, not the exception in string format

class SignUpFailure implements Exception {
  SignUpFailure(String string);
}

class LogInFailure implements Exception {}

class LogInFailureByBadRequest implements Exception {}

class ForgotPasswordFailure implements Exception {
  ForgotPasswordFailure(String string);
}

class ResetPasswordFailure implements Exception {
  ResetPasswordFailure(String string);
}

class SignUpWithInvalidPasswordFailure implements Exception {}

class LogInWithSocialProviderFailure implements Exception {}

class LogInWithEmailAndPasswordFailure implements Exception {}

class LogInUnconfirmedUserFailure implements Exception {}

class FetchUserAttributesFailure implements Exception {}

class GettingCurrentUserFailure implements Exception {}

class ConfirmSignInFailure implements Exception {}
