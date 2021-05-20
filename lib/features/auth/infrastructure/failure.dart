class SignUpFailure implements Exception {
  SignUpFailure(String string);
}

class SignUpWithInvalidPasswordFailure implements Exception {}

class ResetPasswordFailure implements Exception {}

class LogInWithSocialProviderFailure implements Exception {}

class LogInWithEmailAndPasswordFailure implements Exception {}

class LogInUnconfirmedUserFailure implements Exception {}

class FetchUserAttributesFailure implements Exception {}

class GettingCurrentUserFailure implements Exception {}

class ConfirmSignInFailure implements Exception {}
