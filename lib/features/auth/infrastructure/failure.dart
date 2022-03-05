import 'package:thesis_cancer/core/infrastructure/failure.dart';

/// Auth failure errors from:
/// https://github.com/strapi/strapi/blob/master/packages/strapi-plugin-users-permissions/controllers/Auth.js
enum AuthFailureReason {
  ///
  unknown,

  ///
  badRequest,

  ///
  /// Used also for connection problems.
  disabledProvider,

  ///
  invalidUsernamePassword,

  ///
  unconfirmedEmail,

  ///
  blockedAccount,

  ///
  localPassword,
}

///
enum ResetPasswordFailureReason {
  unknown,
  incorrectCode,
  passwordsNoMatch,
  incorrectParams,
  errorAtSendingMessage,
}

///
enum ForgotPasswordFailureReason {
  unknown,
  invalidEmail,
  emailDoesNotExist,
  errorAtSendingMessage,
}

///
enum RegisterFailureReason {
  unknown,
  registeringActionNotAllowed,
  moreThanThreeDollarSymbol,
  defaultRoleNotFound,
  invalidEmail,
  emailAlreadyTaken,
}

///
class LogInFailure extends Failure {
  ///
  LogInFailure({required this.reason});

  @override
  final AuthFailureReason reason;
}

///
class ForgotPasswordFailure extends Failure {
  ///
  ForgotPasswordFailure({required this.reason});

  @override
  final ForgotPasswordFailureReason reason;
}

///
class ResetPasswordFailure extends Failure {
  ///
  ResetPasswordFailure({required this.reason});

  @override
  final ResetPasswordFailureReason reason;
}

///
class SignUpFailure extends Failure {
  ///
  SignUpFailure({required this.reason});

  @override
  final RegisterFailureReason reason;
}
