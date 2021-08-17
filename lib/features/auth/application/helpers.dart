import 'package:thesis_cancer/features/auth/infrastructure/failure.dart';

/// Just for work around.
String localizeAuthFailures(dynamic reason) {
  if (reason is AuthFailureReason) {
    switch (reason) {
      case AuthFailureReason.unknown:
        return "Unknown error at authentication service.";
      case AuthFailureReason.badRequest:
        return "Bad request to the authentication service.";
      case AuthFailureReason.disabledProvider:
        return "The current authentication provider is disabled.";
      case AuthFailureReason.invalidUsernamePassword:
        return "Invalid username or password.";
      case AuthFailureReason.unconfirmedEmail:
        return "Your mail is not confirmed yet.";
      case AuthFailureReason.blockedAccount:
        return "Your account is blocked.";
      case AuthFailureReason.localPassword:
        return "This user never set a local password.\n Sign in with the provider you created your account.";
    }
  } else if (reason is ResetPasswordFailureReason) {
    switch (reason) {
      case ResetPasswordFailureReason.unknown:
        return "Unknown error at resetting password.";
      case ResetPasswordFailureReason.incorrectCode:
        return "You provided an incorrect code.";
      case ResetPasswordFailureReason.passwordsNoMatch:
        return "Passwords does not match.";
      case ResetPasswordFailureReason.incorrectParams:
        return "Incorrect params provided.";
    }
  } else if (reason is ForgotPasswordFailureReason) {
    switch (reason) {
      case ForgotPasswordFailureReason.unknown:
        return "Unknown error at asking reset password code.";
      case ForgotPasswordFailureReason.invalidEmail:
        return "You provided a invalid e-mail.";
      case ForgotPasswordFailureReason.emailDoesNotExist:
        return "The provided e-mail does not exist.";
    }
  } else if (reason is RegisterFailureReason) {
    switch (reason) {
      case RegisterFailureReason.unknown:
        return "Unknown error at registering user.";
      case RegisterFailureReason.registeringActionNotAllowed:
        return "Registering is not allowed in this moment.";
      case RegisterFailureReason.moreThanThreeDollarSymbol:
        return r"You are using $ symbol more than three times.";
      case RegisterFailureReason.defaultRoleNotFound:
        return "Default role was not found.";
      case RegisterFailureReason.invalidEmail:
        return "You provided an invalid e-mail.";
      case RegisterFailureReason.emailAlreadyTaken:
        return "An account with the provided e-mail already does exist.";
    }
  } else {
    return "Unknown authentication failure.";
  }
}
