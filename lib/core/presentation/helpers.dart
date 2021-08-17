import 'dart:ui';

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
List<String> localizeFailure(dynamic reason) {
  if (reason is FailureReason) {
    // Describes a GraphQL error.
    const String title = "Server Error";
    switch (reason) {
      case FailureReason.unknown:
        return <String>[title, "Failure's reason unknown."];
      case FailureReason.unauthorized:
        return <String>[title, "You have no authorization."];
      case FailureReason.notFound:
        return <String>[title, "Requested content was not found."];
      case FailureReason.unableToConnect:
        return <String>[title, "We are unable to connect you in this moment."];
    }
  } else if (reason is SettingsFailureReason) {
    const String title = "Settings Error";
    switch (reason) {
      case SettingsFailureReason.unknown:
        return <String>[
          title,
          "Unknown error at application remote settings service."
        ];
      case SettingsFailureReason.unauthorized:
        return <String>[
          title,
          "You have no authorization to get remote settings."
        ];
      case SettingsFailureReason.notFound:
        return <String>[title, "Requested remote settings were not found"];
    }
  } else if (reason is AuthFailureReason) {
    const String title = "Authentication Error";
    switch (reason) {
      case AuthFailureReason.unknown:
        return <String>[title, "Unknown error at authentication service."];
      case AuthFailureReason.badRequest:
        return <String>[title, "Bad request to the authentication service."];
      case AuthFailureReason.disabledProvider:
        return <String>[
          title,
          "The current authentication provider is disabled.",
        ];
      case AuthFailureReason.invalidUsernamePassword:
        return <String>[title, "Invalid username or password."];
      case AuthFailureReason.unconfirmedEmail:
        return <String>[title, "Your mail is not confirmed yet."];
      case AuthFailureReason.blockedAccount:
        return <String>[title, "Your account is blocked."];
      case AuthFailureReason.localPassword:
        return <String>[
          title,
          "This user never set a local password.\n Sign in with the provider you created your account.",
        ];
    }
  } else if (reason is ResetPasswordFailureReason) {
    const String title = "Reset Password Error";
    switch (reason) {
      case ResetPasswordFailureReason.unknown:
        return <String>[title, "Unknown error at resetting password."];
      case ResetPasswordFailureReason.incorrectCode:
        return <String>[title, "You provided an incorrect code."];
      case ResetPasswordFailureReason.passwordsNoMatch:
        return <String>[title, "Passwords does not match."];
      case ResetPasswordFailureReason.incorrectParams:
        return <String>[title, "Incorrect params provided."];
    }
  } else if (reason is ForgotPasswordFailureReason) {
    const String title = "Forgot Password Error";
    switch (reason) {
      case ForgotPasswordFailureReason.unknown:
        return <String>[title, "Unknown error at asking reset password code."];
      case ForgotPasswordFailureReason.invalidEmail:
        return <String>[title, "You provided a invalid e-mail."];
      case ForgotPasswordFailureReason.emailDoesNotExist:
        return <String>[title, "The provided e-mail does not exist."];
    }
  } else if (reason is RegisterFailureReason) {
    const String title = "Register Error";
    switch (reason) {
      case RegisterFailureReason.unknown:
        return <String>[title, "Unknown error at registering user."];
      case RegisterFailureReason.registeringActionNotAllowed:
        return <String>[title, "Registering is not allowed in this moment."];
      case RegisterFailureReason.moreThanThreeDollarSymbol:
        return <String>[
          title,
          r"You are using $ symbol more than three times."
        ];
      case RegisterFailureReason.defaultRoleNotFound:
        return <String>[title, "Default role was not found."];
      case RegisterFailureReason.invalidEmail:
        return <String>[title, "You provided an invalid e-mail."];
      case RegisterFailureReason.emailAlreadyTaken:
        return <String>[
          title,
          "An account with the provided e-mail already does exist."
        ];
    }
  } else if (reason is PostFailureReason) {
    const String title = "Post Error";
    switch (reason) {
      case PostFailureReason.unknown:
        return <String>[title, "Unknown error at Post service."];
      case PostFailureReason.unauthorized:
        return <String>[
          title,
          "You have no authorization to access to the Post service."
        ];
      case PostFailureReason.notFound:
        return <String>[title, "Requested post or posts was not found."];
      case PostFailureReason.unexpectedResult:
        return <String>[
          title,
          "Unexpected result at querying to Post service."
        ];
    }
  } else if (reason is FileFailureReason) {
    const String title = "File Error";
    switch (reason) {
      case FileFailureReason.unknown:
        return <String>[title, "Unknown error at File service."];
      case FileFailureReason.unauthorized:
        return <String>[
          title,
          "You have no authorization to access to the File service."
        ];
      case FileFailureReason.notFound:
        return <String>[title, "Requested file was not found."];
      case FileFailureReason.unexpectedResult:
        return <String>[
          title,
          "Unexpected result at querying to File service."
        ];
    }
  } else if (reason is ResultFailureReason) {
    const String title = "Survey Result Error";
    switch (reason) {
      case ResultFailureReason.unknown:
        return <String>[title, "Unknown error at Survey service."];
      case ResultFailureReason.unauthorized:
        return <String>[
          title,
          "You have no authorization to access to the Survey service."
        ];
      case ResultFailureReason.notFound:
        return <String>[title, "Requested survey's result was not found."];
      case ResultFailureReason.unexpectedResult:
        return <String>[
          title,
          "Unexpected result at querying te survey's result to Survey service."
        ];
    }
  } else if (reason is SurveyFailureReason) {
    const String title = "Survey Error";
    switch (reason) {
      case SurveyFailureReason.unknown:
        return <String>[title, "Unknown error at Survey service."];
      case SurveyFailureReason.unauthorized:
        return <String>[
          title,
          "You have no authorization to access to the Survey service."
        ];
      case SurveyFailureReason.notFound:
        return <String>[title, "Requested survey was not found."];
      case SurveyFailureReason.unexpectedResult:
        return <String>[
          title,
          "Unexpected result at querying the Survey service."
        ];
    }
  } else if (reason is ProfileFailureReason) {
    const String title = "Profile Error";
    switch (reason) {
      case ProfileFailureReason.unknown:
        return <String>[title, "Unknown error at Account service."];
      case ProfileFailureReason.unauthorized:
        return <String>[
          title,
          "You have no authorization to access to the Account service."
        ];
      case ProfileFailureReason.notFound:
        return <String>[title, "Requested profile was not found."];
      case ProfileFailureReason.notValidProfile:
        return <String>[title, "The user has no a valid profile"];
    }
  } else if (reason is UserFailureReason) {
    const String title = "User Error";
    switch (reason) {
      case UserFailureReason.unknown:
        return <String>[title, "Unknown error at Account service."];
      case UserFailureReason.unauthorized:
        return <String>[
          title,
          "You have no authorization to access to the Account service."
        ];
      case UserFailureReason.notFound:
        return <String>[title, "Requested user was not found."];
    }
  } else {
    return <String>["Error", "An error was found."];
  }
}
