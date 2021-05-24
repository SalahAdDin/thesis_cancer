import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/application/routes/router.gr.dart';
import 'package:thesis_cancer/core/domain/configuration.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/features/auth/application/auth.notifier.dart';
import 'package:thesis_cancer/features/auth/application/auth.provider.dart';
import 'package:thesis_cancer/features/auth/application/auth.state.dart';
import 'package:thesis_cancer/features/auth/presentation/widgets/confirm_password.dart';
import 'package:thesis_cancer/features/home/presentation/pages/splash_screen.dart';

class LoginScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AuthState authScreenState = useProvider(authNotifierProvider);

    final AuthNotifier authNotifier =
        useProvider(authNotifierProvider.notifier);

    final userState = useProvider(userEntityProvider);

    return FlutterLogin(
      title: AppLiterals.title,
      footer: AppLiterals.copyRight,
      // TODO: logo: '',
      messages: LoginMessages(usernameHint: "e-postanın adresi!"),
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
      onSignup: (LoginData data) => authNotifier.registerUser(
          username: data.name, password: data.password),
      onLogin: (LoginData data) =>
          authNotifier.signIn(username: data.name, password: data.password),
      onRecoverPassword: (String name) =>
          authNotifier.recoverPassword(username: name),
      onSubmitAnimationCompleted: () => authScreenState.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          signedUp: () => context.router.root.replace(SurveyRoute(
              onCompleteSurvey: () =>
                  context.router.replace(const LobbyRoute()),
              surveyID: registerSurveyID)),
          // TODO: create ChangePassword screen.
          requestedResetPassword: () => null,
          loggedIn: () => context.router.root.replace(HomeRoute()),
          requiresConfirmSignIn: () => pushToPage(
              context,
              /* TODO: In theory, after confirming the new password,
                  it changes the status to logged in, then, going to
                  the splashScreen will load the LogInScreen,
                  which is in loggedIn state, sending us to the home page. */
              ConfirmPasswordWidget(
                  onConfirm: (String confirmationCode) => authNotifier
                      .confirmSignIn(confirmationCode: confirmationCode)
                      .then((value) =>
                          pushAndReplaceToPage(context, SplashScreen())))),
          // TODO: extract to a widget to avoid boilerplate
          error: (error) => ErrorScreen(
                message: error,
                actionLabel: 'Home',
                onPressed: () => pushAndReplaceToPage(context, SplashScreen()),
              ),
          loggedOut: () => pushAndReplaceToPage(context, SplashScreen())),
    );
  }
}
