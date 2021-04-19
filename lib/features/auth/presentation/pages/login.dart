import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/domain/configuration.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/features/auth/application/auth.notifier.dart';
import 'package:thesis_cancer/features/auth/application/auth.state.dart';
import 'package:thesis_cancer/features/auth/application/provider.dart';
import 'package:thesis_cancer/features/auth/presentation/widgets/confirm_password.dart';
import 'package:thesis_cancer/features/home/presentation/pages/lobby_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/main_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/splash_screen.dart';
import 'package:thesis_cancer/features/survey/presentation/pages/survey_screen.dart';
import 'package:thesis_cancer/features/user/application/provider.dart';

class LoginScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AuthState authScreenState = useProvider(authNotifierProvider);

    final AuthNotifier authNotifier =
        useProvider(authNotifierProvider.notifier);

    final homeScreenProvider = useProvider(homeScreenNotifierProvider.notifier);

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
          loading: () => Center(child: CircularProgressIndicator()),
          // TODO: How to pass this user to survey? to LobbyScreen? Is it needed?
          signedUp: (signedUpUser) => pushAndReplaceToPage(
              context,
              SurveyScreen(
                  onCompleteSurvey: () => pushToPage(context, LobbyScreen()))),
          // TODO: create ChangePassword screen.
          requestedResetPassword: () => null,
          // TODO: How to get the first time at login (create a new profile on database here)?
          loggedIn: (loggedInUser) {
            homeScreenProvider.setCurrentUser(loggedInUser);
            pushAndReplaceToPage(context, MainScreen());
          },
          requiresConfirmSignIn: () => pushToPage(
              context,
              /* TODO: In theory, after confirming the new password,
                  it changes the status to logged in, then, going to
                  the splashScreen will load the LogInScreen,
                  which is in loggedIn state, sending us to the home page. */
              ConfirmPasswordWidget(
                  onConfirm: (String confirmationCode) => context
                      .read(authNotifierProvider.notifier)
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
