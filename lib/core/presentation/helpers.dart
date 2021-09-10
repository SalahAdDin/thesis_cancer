import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/features/auth/infrastructure/failure.dart';
import 'package:thesis_cancer/features/content/infrastructure/failure.dart';
import 'package:thesis_cancer/features/media/infrastructure/failure.dart';
import 'package:thesis_cancer/features/survey/infrastructure/failure.dart';
import 'package:thesis_cancer/features/user/infrastructure/failure.dart';

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
List<String> localizeFailure(dynamic reason, BuildContext context) {
  if (reason is FailureReason) {
    // Describes a GraphQL error.
    final String title = AppLocalizations.of(context)!.serverErrorTitle;
    switch (reason) {
      case FailureReason.unknown:
        return <String>[
          title,
          AppLocalizations.of(context)!.failureUnknownLabel
        ];
      case FailureReason.unauthorized:
        return <String>[
          title,
          AppLocalizations.of(context)!.failureUnauthorizedLabel
        ];
      case FailureReason.notFound:
        return <String>[
          title,
          AppLocalizations.of(context)!.failureNotFoundLabel
        ];
      case FailureReason.unableToConnect:
        return <String>[
          title,
          AppLocalizations.of(context)!.failureUnableToConnectLabel
        ];
      case FailureReason.unableToParse:
        return <String>[
          title,
          AppLocalizations.of(context)!.failureUnableToParseLabel
        ];
    }
  } else if (reason is SettingsFailureReason) {
    final String title = AppLocalizations.of(context)!.settingsErrorTitle;
    switch (reason) {
      case SettingsFailureReason.unknown:
        return <String>[
          title,
          AppLocalizations.of(context)!.settingsFailureUnknown
        ];
      case SettingsFailureReason.unauthorized:
        return <String>[
          title,
          AppLocalizations.of(context)!.settingsFailureUnauthorized
        ];
      case SettingsFailureReason.notFound:
        return <String>[
          title,
          AppLocalizations.of(context)!.settingsFailureNotFound
        ];
    }
  } else if (reason is AuthFailureReason) {
    final String title = AppLocalizations.of(context)!.authenticationErrorTitle;
    switch (reason) {
      case AuthFailureReason.unknown:
        return <String>[
          title,
          AppLocalizations.of(context)!.authFailureUnknown
        ];
      case AuthFailureReason.badRequest:
        return <String>[
          title,
          AppLocalizations.of(context)!.authFailureBadRequest
        ];
      case AuthFailureReason.disabledProvider:
        return <String>[
          title,
          AppLocalizations.of(context)!.authFailureDisabledProvider
        ];
      case AuthFailureReason.invalidUsernamePassword:
        return <String>[
          title,
          AppLocalizations.of(context)!.authFailureInvalidUsernamePassword
        ];
      case AuthFailureReason.unconfirmedEmail:
        return <String>[
          title,
          AppLocalizations.of(context)!.authFailureUnconfirmedEmail
        ];
      case AuthFailureReason.blockedAccount:
        return <String>[
          title,
          AppLocalizations.of(context)!.authFailureBlockedAccount
        ];
      case AuthFailureReason.localPassword:
        return <String>[
          title,
          AppLocalizations.of(context)!.authFailureLocalPassword
        ];
    }
  } else if (reason is ResetPasswordFailureReason) {
    final String title = AppLocalizations.of(context)!.resetPasswordErrorTItle;
    switch (reason) {
      case ResetPasswordFailureReason.unknown:
        return <String>[
          title,
          AppLocalizations.of(context)!.resetPasswordFailureUnknown
        ];
      case ResetPasswordFailureReason.incorrectCode:
        return <String>[
          title,
          AppLocalizations.of(context)!.resetPasswordFailureIncorrectCode
        ];
      case ResetPasswordFailureReason.passwordsNoMatch:
        return <String>[
          title,
          AppLocalizations.of(context)!.resetPasswordFailureNotMatch
        ];
      case ResetPasswordFailureReason.incorrectParams:
        return <String>[
          title,
          AppLocalizations.of(context)!.resetPasswordFailureIncorrectParams
        ];
      case ResetPasswordFailureReason.errorAtSendingMessage:
        return <String>[
          title,
          AppLocalizations.of(context)!.resetPasswordFailureAtSendingMessage
        ];
    }
  } else if (reason is ForgotPasswordFailureReason) {
    final String title = AppLocalizations.of(context)!.forgotPasswordErrorTitle;
    switch (reason) {
      case ForgotPasswordFailureReason.unknown:
        return <String>[
          title,
          AppLocalizations.of(context)!.forgotPasswordFailureUnknown
        ];
      case ForgotPasswordFailureReason.invalidEmail:
        return <String>[
          title,
          AppLocalizations.of(context)!.forgotPasswordFailureInvalidEmail
        ];
      case ForgotPasswordFailureReason.emailDoesNotExist:
        return <String>[
          title,
          AppLocalizations.of(context)!.forgotPasswordFailureEmailDoesNotExist
        ];
      case ForgotPasswordFailureReason.errorAtSendingMessage:
        return <String>[
          title,
          AppLocalizations.of(context)!.forgotPasswordFailureAtSendingMessage
        ];
    }
  } else if (reason is RegisterFailureReason) {
    final String title = AppLocalizations.of(context)!.registerErrorTitle;
    switch (reason) {
      case RegisterFailureReason.unknown:
        return <String>[
          title,
          AppLocalizations.of(context)!.registerFailureUnknown
        ];
      case RegisterFailureReason.registeringActionNotAllowed:
        return <String>[
          title,
          AppLocalizations.of(context)!.registerFailureActionNotAllowed
        ];
      case RegisterFailureReason.moreThanThreeDollarSymbol:
        return <String>[
          title,
          AppLocalizations.of(context)!.registerFailureMoreThanThreeDollarSymbol
        ];
      case RegisterFailureReason.defaultRoleNotFound:
        return <String>[
          title,
          AppLocalizations.of(context)!.registerFailureDefaultRoleNotFound
        ];
      case RegisterFailureReason.invalidEmail:
        return <String>[
          title,
          AppLocalizations.of(context)!.registerFailureInvalidEmail
        ];
      case RegisterFailureReason.emailAlreadyTaken:
        return <String>[
          title,
          AppLocalizations.of(context)!.registerFailureEmailAlreadyTaken
        ];
    }
  } else if (reason is PostFailureReason) {
    final String title = AppLocalizations.of(context)!.postErrorTitle;
    switch (reason) {
      case PostFailureReason.unknown:
        return <String>[
          title,
          AppLocalizations.of(context)!.postFailureUnknown
        ];
      case PostFailureReason.unauthorized:
        return <String>[
          title,
          AppLocalizations.of(context)!.postFailureUnauthorized
        ];
      case PostFailureReason.notFound:
        return <String>[
          title,
          AppLocalizations.of(context)!.postFailureNotFound
        ];
      case PostFailureReason.unexpectedResult:
        return <String>[
          title,
          AppLocalizations.of(context)!.postFailureUnexpectedResult
        ];
    }
  } else if (reason is FileFailureReason) {
    final String title = AppLocalizations.of(context)!.fileErrorTitle;
    switch (reason) {
      case FileFailureReason.unknown:
        return <String>[
          title,
          AppLocalizations.of(context)!.fileFailureUnknown
        ];
      case FileFailureReason.unauthorized:
        return <String>[
          title,
          AppLocalizations.of(context)!.fileFailureUnauthorized
        ];
      case FileFailureReason.notFound:
        return <String>[
          title,
          AppLocalizations.of(context)!.fileFailureNotFound
        ];
      case FileFailureReason.unexpectedResult:
        return <String>[
          title,
          AppLocalizations.of(context)!.fileFailureUnexpectedResult
        ];
    }
  } else if (reason is ResultFailureReason) {
    final String title = AppLocalizations.of(context)!.surveyResultErrorTitle;
    switch (reason) {
      case ResultFailureReason.unknown:
        return <String>[
          title,
          AppLocalizations.of(context)!.resultFailureUnknown
        ];
      case ResultFailureReason.unauthorized:
        return <String>[
          title,
          AppLocalizations.of(context)!.resultFailureUnauthorized
        ];
      case ResultFailureReason.notFound:
        return <String>[
          title,
          AppLocalizations.of(context)!.resultFailureNotFound
        ];
      case ResultFailureReason.unexpectedResult:
        return <String>[
          title,
          AppLocalizations.of(context)!.resultFailureUnexpectedResult
        ];
    }
  } else if (reason is SurveyFailureReason) {
    final String title = AppLocalizations.of(context)!.surveyErrorTitle;
    switch (reason) {
      case SurveyFailureReason.unknown:
        return <String>[
          title,
          AppLocalizations.of(context)!.surveyFailureUnknown
        ];
      case SurveyFailureReason.unauthorized:
        return <String>[
          title,
          AppLocalizations.of(context)!.surveyFailureUnauthorized
        ];
      case SurveyFailureReason.notFound:
        return <String>[
          title,
          AppLocalizations.of(context)!.surveyFailureNotFound
        ];
      case SurveyFailureReason.unexpectedResult:
        return <String>[
          title,
          AppLocalizations.of(context)!.surveyFailureUnexpectedResult
        ];
    }
  } else if (reason is ProfileFailureReason) {
    final String title = AppLocalizations.of(context)!.profileErrorTitle;
    switch (reason) {
      case ProfileFailureReason.unknown:
        return <String>[
          title,
          AppLocalizations.of(context)!.profileFailureUnknown
        ];
      case ProfileFailureReason.unauthorized:
        return <String>[
          title,
          AppLocalizations.of(context)!.profileFailureUnauthorized
        ];
      case ProfileFailureReason.notFound:
        return <String>[
          title,
          AppLocalizations.of(context)!.profileFailureNotFound
        ];
      case ProfileFailureReason.notValidProfile:
        return <String>[
          title,
          AppLocalizations.of(context)!.profileFailureNotValidProfile
        ];
    }
  } else if (reason is UserFailureReason) {
    final String title = AppLocalizations.of(context)!.userErrorTitle;
    switch (reason) {
      case UserFailureReason.unknown:
        return <String>[
          title,
          AppLocalizations.of(context)!.userFailureUnknown
        ];
      case UserFailureReason.unauthorized:
        return <String>[
          title,
          AppLocalizations.of(context)!.userFailureUnauthorized
        ];
      case UserFailureReason.notFound:
        return <String>[
          title,
          AppLocalizations.of(context)!.userFailureNotFound
        ];
    }
  } else {
    return <String>[
      AppLocalizations.of(context)!.errorLabel,
      AppLocalizations.of(context)!.defaultErrorMessage
    ];
  }
}
