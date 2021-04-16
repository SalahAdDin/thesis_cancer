import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thesis_cancer/auth/application/provider.dart';
import 'package:thesis_cancer/auth/presentation/widgets/confirm_password.dart';
import 'package:thesis_cancer/home/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/home/presentation/pages/lobby_screen.dart';
import 'package:thesis_cancer/home/presentation/pages/main_screen.dart';
import 'package:thesis_cancer/home/presentation/pages/splash_screen.dart';
import 'package:thesis_cancer/user/application/provider.dart';
import 'package:thesis_cancer/utils/configuration.dart';
import 'package:thesis_cancer/utils/navigator.dart';

class LoginScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final authScreenState = useProvider(authNotifierProvider.state);
    return FlutterLogin(
      title: AppLiterals.title,
      footer: AppLiterals.copyRight,
      // TODO: logo: '',
      messages: LoginMessages(usernameHint: "e-postanın adresi!"),
      loginProviders: <LoginProvider>[
        LoginProvider(
            icon: MdiIcons.facebook,
            callback: () =>
                context.read(authNotifierProvider).signInWithFacebook()),
        LoginProvider(
            icon: MdiIcons.google,
            callback: () =>
                context.read(authNotifierProvider).signInWithGoogle()),
        LoginProvider(
            icon: MdiIcons.apple,
            callback: () =>
                context.read(authNotifierProvider).signInWithApple()),
      ],
      onSignup: (LoginData data) => context
          .read(authNotifierProvider)
          .registerUser(username: data.name, password: data.password),
      onLogin: (LoginData data) => context
          .read(authNotifierProvider)
          .signIn(username: data.name, password: data.password),
      onRecoverPassword: (String name) =>
          context.read(authNotifierProvider).recoverPassword(username: name),
      onSubmitAnimationCompleted: () => authScreenState.when(
          loading: () => Center(child: CircularProgressIndicator()),
          signedUp: (signedUpUser) => pushToPage(context, LobbyScreen()),
          // TODO: create ChangePassword screen.
          requestedResetPassword: () => null,
          // TODO: How to get the first time at login (create a new profile on database here)?
          loggedIn: (loggedInUser) {
            context.read(homeScreenProvider).setCurrentUser(loggedInUser);
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
                      .read(authNotifierProvider)
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
