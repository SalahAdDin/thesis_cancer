import 'package:flutter/widgets.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/auth/infrastructure/failure.dart';
import 'package:thesis_cancer/features/content/infrastructure/failure.dart';
import 'package:thesis_cancer/features/media/infrastructure/failure.dart';
import 'package:thesis_cancer/features/survey/infrastructure/failure.dart';
import 'package:thesis_cancer/features/user/infrastructure/failure.dart';
import 'package:thesis_cancer/l10n/l10n.dart';

/// List of colors to randomize backgrounds.
const List<Color> colors = <Color>[
  Color(0xfffd5353),
  Color(0xff00a478),
  Color(0xfff5a2d9),
  Color(0xfff0c722),
  Color(0xff6a85e5),
  Color(0xfffd9a6f),
  Color(0xff92db6e),
  Color(0xff73b8e5),
  Color(0xfffd7590),
  Color(0xffc78ae5),
  Color(0xffccede4),
  Color(0xff3c4952),
];

/// Get a background color for the Avatar's component
/// based on the user's avatar's url.
Color getUserAvatarNameColor(String url) {
  final int index = url.hashCode % colors.length;

  return colors[index];
}

// Can be replaced by proper i18n
///
List<String> localizeFailure(dynamic reason, BuildContext context) {
  if (reason is FailureReason) {
    // Describes a GraphQL error.
    final String title = context.l10n!.serverErrorTitle;
    switch (reason) {
      case FailureReason.unknown:
        return <String>[title, context.l10n!.failureUnknownLabel];
      case FailureReason.unauthorized:
        return <String>[title, context.l10n!.failureUnauthorizedLabel];
      case FailureReason.notFound:
        return <String>[title, context.l10n!.failureNotFoundLabel];
      case FailureReason.unableToConnect:
        return <String>[title, context.l10n!.failureUnableToConnectLabel];
      case FailureReason.unableToParse:
        return <String>[title, context.l10n!.failureUnableToParseLabel];
    }
  } else if (reason is SettingsFailureReason) {
    final String title = context.l10n!.settingsErrorTitle;
    switch (reason) {
      case SettingsFailureReason.unknown:
        return <String>[title, context.l10n!.settingsFailureUnknown];
      case SettingsFailureReason.unauthorized:
        return <String>[title, context.l10n!.settingsFailureUnauthorized];
      case SettingsFailureReason.notFound:
        return <String>[title, context.l10n!.settingsFailureNotFound];
    }
  } else if (reason is AuthFailureReason) {
    final String title = context.l10n!.authenticationErrorTitle;
    switch (reason) {
      case AuthFailureReason.unknown:
        return <String>[title, context.l10n!.authFailureUnknown];
      case AuthFailureReason.badRequest:
        return <String>[title, context.l10n!.authFailureBadRequest];
      case AuthFailureReason.disabledProvider:
        return <String>[title, context.l10n!.authFailureDisabledProvider];
      case AuthFailureReason.invalidUsernamePassword:
        return <String>[
          title,
          context.l10n!.authFailureInvalidUsernamePassword
        ];
      case AuthFailureReason.unconfirmedEmail:
        return <String>[title, context.l10n!.authFailureUnconfirmedEmail];
      case AuthFailureReason.blockedAccount:
        return <String>[title, context.l10n!.authFailureBlockedAccount];
      case AuthFailureReason.localPassword:
        return <String>[title, context.l10n!.authFailureLocalPassword];
    }
  } else if (reason is ResetPasswordFailureReason) {
    final String title = context.l10n!.resetPasswordErrorTItle;
    switch (reason) {
      case ResetPasswordFailureReason.unknown:
        return <String>[title, context.l10n!.resetPasswordFailureUnknown];
      case ResetPasswordFailureReason.incorrectCode:
        return <String>[title, context.l10n!.resetPasswordFailureIncorrectCode];
      case ResetPasswordFailureReason.passwordsNoMatch:
        return <String>[title, context.l10n!.resetPasswordFailureNotMatch];
      case ResetPasswordFailureReason.incorrectParams:
        return <String>[
          title,
          context.l10n!.resetPasswordFailureIncorrectParams
        ];
      case ResetPasswordFailureReason.errorAtSendingMessage:
        return <String>[
          title,
          context.l10n!.resetPasswordFailureAtSendingMessage
        ];
    }
  } else if (reason is ForgotPasswordFailureReason) {
    final String title = context.l10n!.forgotPasswordErrorTitle;
    switch (reason) {
      case ForgotPasswordFailureReason.unknown:
        return <String>[title, context.l10n!.forgotPasswordFailureUnknown];
      case ForgotPasswordFailureReason.invalidEmail:
        return <String>[title, context.l10n!.forgotPasswordFailureInvalidEmail];
      case ForgotPasswordFailureReason.emailDoesNotExist:
        return <String>[
          title,
          context.l10n!.forgotPasswordFailureEmailDoesNotExist
        ];
      case ForgotPasswordFailureReason.errorAtSendingMessage:
        return <String>[
          title,
          context.l10n!.forgotPasswordFailureAtSendingMessage
        ];
    }
  } else if (reason is RegisterFailureReason) {
    final String title = context.l10n!.registerErrorTitle;
    switch (reason) {
      case RegisterFailureReason.unknown:
        return <String>[title, context.l10n!.registerFailureUnknown];
      case RegisterFailureReason.registeringActionNotAllowed:
        return <String>[title, context.l10n!.registerFailureActionNotAllowed];
      case RegisterFailureReason.moreThanThreeDollarSymbol:
        return <String>[
          title,
          context.l10n!.registerFailureMoreThanThreeDollarSymbol
        ];
      case RegisterFailureReason.defaultRoleNotFound:
        return <String>[
          title,
          context.l10n!.registerFailureDefaultRoleNotFound
        ];
      case RegisterFailureReason.invalidEmail:
        return <String>[title, context.l10n!.registerFailureInvalidEmail];
      case RegisterFailureReason.emailAlreadyTaken:
        return <String>[title, context.l10n!.registerFailureEmailAlreadyTaken];
    }
  } else if (reason is PostFailureReason) {
    final String title = context.l10n!.postErrorTitle;
    switch (reason) {
      case PostFailureReason.unknown:
        return <String>[title, context.l10n!.postFailureUnknown];
      case PostFailureReason.unauthorized:
        return <String>[title, context.l10n!.postFailureUnauthorized];
      case PostFailureReason.notFound:
        return <String>[title, context.l10n!.postFailureNotFound];
      case PostFailureReason.unexpectedResult:
        return <String>[title, context.l10n!.postFailureUnexpectedResult];
    }
  } else if (reason is FileFailureReason) {
    final String title = context.l10n!.fileErrorTitle;
    switch (reason) {
      case FileFailureReason.unknown:
        return <String>[title, context.l10n!.fileFailureUnknown];
      case FileFailureReason.unauthorized:
        return <String>[title, context.l10n!.fileFailureUnauthorized];
      case FileFailureReason.notFound:
        return <String>[title, context.l10n!.fileFailureNotFound];
      case FileFailureReason.unexpectedResult:
        return <String>[title, context.l10n!.fileFailureUnexpectedResult];
    }
  } else if (reason is ResultFailureReason) {
    final String title = context.l10n!.surveyResultErrorTitle;
    switch (reason) {
      case ResultFailureReason.unknown:
        return <String>[title, context.l10n!.resultFailureUnknown];
      case ResultFailureReason.unauthorized:
        return <String>[title, context.l10n!.resultFailureUnauthorized];
      case ResultFailureReason.notFound:
        return <String>[title, context.l10n!.resultFailureNotFound];
      case ResultFailureReason.unexpectedResult:
        return <String>[title, context.l10n!.resultFailureUnexpectedResult];
    }
  } else if (reason is SurveyFailureReason) {
    final String title = context.l10n!.surveyErrorTitle;
    switch (reason) {
      case SurveyFailureReason.unknown:
        return <String>[title, context.l10n!.surveyFailureUnknown];
      case SurveyFailureReason.unauthorized:
        return <String>[title, context.l10n!.surveyFailureUnauthorized];
      case SurveyFailureReason.notFound:
        return <String>[title, context.l10n!.surveyFailureNotFound];
      case SurveyFailureReason.unexpectedResult:
        return <String>[title, context.l10n!.surveyFailureUnexpectedResult];
    }
  } else if (reason is ProfileFailureReason) {
    final String title = context.l10n!.profileErrorTitle;
    switch (reason) {
      case ProfileFailureReason.unknown:
        return <String>[title, context.l10n!.profileFailureUnknown];
      case ProfileFailureReason.unauthorized:
        return <String>[title, context.l10n!.profileFailureUnauthorized];
      case ProfileFailureReason.notFound:
        return <String>[title, context.l10n!.profileFailureNotFound];
      case ProfileFailureReason.notValidProfile:
        return <String>[title, context.l10n!.profileFailureNotValidProfile];
    }
  } else if (reason is UserFailureReason) {
    final String title = context.l10n!.userErrorTitle;
    switch (reason) {
      case UserFailureReason.unknown:
        return <String>[title, context.l10n!.userFailureUnknown];
      case UserFailureReason.unauthorized:
        return <String>[title, context.l10n!.userFailureUnauthorized];
      case UserFailureReason.notFound:
        return <String>[title, context.l10n!.userFailureNotFound];
    }
  } else {
    return <String>[
      context.l10n!.errorLabel,
      context.l10n!.defaultErrorMessage
    ];
  }
}
