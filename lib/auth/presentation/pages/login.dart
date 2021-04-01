import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:thesis_cancer/utils/configuration.dart';

class LoginScreen extends StatelessWidget {
  Duration get loginTime => Duration(milliseconds: 2250);

  /*final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    // phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }*/

  // Future<String> _registerUser(LoginData data) async {}

  // Future<String> _signIn(LoginData data) async {}

  // Future<String> _signInWithFacebook(LoginData data) async {}

  // Future<String> _signInWithGoogle(LoginData data) async {}

  // Future<String> _signInWithApple(LoginData data) async {}

  // Future<String> _recoverPassword(LoginData data) async {}

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: AppLiterals.title,
      footer: AppLiterals.copyRight,
      // TODO: logo: '',
      messages: LoginMessages(usernameHint: "e-postanın adresi!"),
      loginProviders: <LoginProvider>[
        LoginProvider(
            icon: MdiIcons.facebook,
            callback: () async => await Future.delayed(loginTime)),
        LoginProvider(
            icon: MdiIcons.google,
            callback: () async => await Future.delayed(loginTime)),
        LoginProvider(
            icon: MdiIcons.apple,
            callback: () async => await Future.delayed(loginTime)),
      ],
      onSignup: (_) => null,
      onLogin: (_) => null,
      onRecoverPassword: (_) => null,
      /* TODO:
      - after sign in go to waiting state, 
      - after login: 
        ADMIN -> Dashboard,
        Others -> HomePage 
        onSubmitAnimationCompleted: () => pushToPage(context, LivingRoomScreen())),
        onSubmitAnimationCompleted: () => pushToPage(context, DashboadScreen()),*/
    );
  }
}
