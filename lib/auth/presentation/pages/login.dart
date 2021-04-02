import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thesis_cancer/auth/presentation/provider.dart';
import 'package:thesis_cancer/home/presentation/pages/home.dart';
import 'package:thesis_cancer/home/presentation/pages/lobby_screen.dart';
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
          requestedResetPassword: () => null,
          loggedIn: (loggedInUser) => pushToPage(
              context,
              HomeScreen(
                currentUser: loggedInUser,
              )),
          error: (error) {
            final errorSnackBar = SnackBar(
              content: Row(
                children: [
                  Icon(Icons.bolt, color: Theme.of(context).errorColor),
                  Text(
                    error,
                    style: TextStyle(color: Theme.of(context).errorColor),
                  )
                ],
              ),
              backgroundColor: Theme.of(context).backgroundColor,
              duration: Duration(milliseconds: 1500),
            );
            ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
          }),
    );
  }
}
