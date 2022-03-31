import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/domain/constants.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/core/presentation/helpers.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/features/auth/application/auth.provider.dart';
import 'package:thesis_cancer/features/auth/application/auth.state.dart';
import 'package:thesis_cancer/features/auth/presentation/pages/lobby_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/main_screen.dart';
import 'package:thesis_cancer/features/survey/presentation/pages/survey_screen.dart';
import 'package:thesis_cancer/l10n/l10n.dart';

/// Login Screen
class LoginScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AuthState authScreenState = useProvider(authNotifierProvider);
    final String registerSurveyID =
        useProvider(settingsNotifierProvider).registeringSurvey ?? '';
    final FirebaseAnalytics _analytics = useProvider(firebaseAnalyticsProvider);

    Future<void> _setScreenAnalytics() async {
      await _analytics.setCurrentScreen(
        screenName: "Login Screen",
      );
    }

    useEffect(
      () {
        _setScreenAnalytics();

        return null;
      },
      const <Object>[],
    );

    return FlutterLogin(
      title: AppLiterals.title,
      footer: AppLiterals.copyRight,
      // TODO: logo: '',
      messages: LoginMessages(
        userHint: context.l10n!.userHint,
        passwordHint: context.l10n!.passwordHint,
        confirmPasswordHint: context.l10n!.confirmPasswordHint,
        forgotPasswordButton: context.l10n!.forgotPasswordButton,
        loginButton: context.l10n!.loginButton,
        signupButton: context.l10n!.signupButton,
        recoverPasswordButton: context.l10n!.recoverPasswordButton,
        recoverPasswordIntro: context.l10n!.recoverPasswordIntro,
        recoverPasswordDescription: context.l10n!.recoverPasswordDescription,
        goBackButton: context.l10n!.back,
        confirmPasswordError: context.l10n!.confirmPasswordError,
        recoverCodePasswordDescription:
            context.l10n!.recoverCodePasswordDescription,
        recoverPasswordSuccess: context.l10n!.recoverPasswordSuccess,
        flushbarTitleError: context.l10n!.errorLabel,
        flushbarTitleSuccess: context.l10n!.flushBarTitleSuccess,
        signUpSuccess: context.l10n!.signUpSuccess,
      ),
      navigateBackAfterRecovery: true,
      /* TODO:
      loginProviders: <LoginProvider>[
        LoginProvider(
            icon: MdiIcons.facebook,
            callback: () => authNotifier.signInWithFacebook()),
        LoginProvider(
            icon: MdiIcons.google,
            callback: () => authNotifier.signInWithGoogle()),
        LoginProvider(
            icon: MdiIcons.apple,
            callback: () => authNotifier.signInWithApple()),
      ],
      */
      onSignup: (SignupData data) async {
        try {
          await context.read(authNotifierProvider.notifier).registerUser(
                username: data.name!,
                password: data.password!,
              );

          return null;
        } on Failure catch (error) {
          return localizeFailure(error.reason, context).last;
        }
      },
      onLogin: (LoginData data) async {
        try {
          await context.read(authNotifierProvider.notifier).signIn(
                username: data.name,
                password: data.password,
              );

          return null;
        } on Failure catch (error) {
          return localizeFailure(error.reason, context).last;
        }
      },
      onRecoverPassword: (String identifier) async {
        try {
          await context
              .read(authNotifierProvider.notifier)
              .requestPasswordRecovery(email: identifier);

          return null;
        } on Failure catch (error) {
          return localizeFailure(error.reason, context).last;
        }
      },
      onConfirmRecover: (String confirmationCode, LoginData data) async {
        try {
          await context.read(authNotifierProvider.notifier).recoverPassword(
                password: data.name,
                passwordConfirmation: data.password,
                confirmationCode: confirmationCode,
              );

          return null;
        } on Failure catch (error) {
          return localizeFailure(error.reason, context).last;
        }
      },
      onSubmitAnimationCompleted: () => authScreenState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        signedUp: () => pushToPage(
          Navigator.of(context),
          SurveyScreen(
            onCompleteSurvey: () => pushAndReplaceToPage(
              Navigator.of(context),
              const LobbyScreen(),
            ),
            surveyID: registerSurveyID,
          ),
        ),
        loggedIn: () => context.read(launcherProvider.notifier).singIn(),
        // TODO: block backward arrow button on this screen (LoginScreen breaks here).
        error: (Failure? error) => ErrorScreen(
          reason: error?.reason,
          actionLabel: context.l10n!.homeLabel,
          onPressed: () =>
              pushAndReplaceToPage(Navigator.of(context), MainScreen()),
        ),
      ),
    );
  }
}
