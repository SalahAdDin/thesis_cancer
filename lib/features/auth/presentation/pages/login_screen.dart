import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/features/auth/application/auth.notifier.dart';
import 'package:thesis_cancer/features/auth/application/auth.provider.dart';
import 'package:thesis_cancer/features/auth/application/auth.state.dart';
import 'package:thesis_cancer/features/auth/presentation/widgets/reset_password.dart';
import 'package:thesis_cancer/features/home/presentation/pages/lobby_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/main_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/splash_screen.dart';
import 'package:thesis_cancer/features/survey/presentation/pages/survey_screen.dart';

class LoginScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final AuthState authScreenState = useProvider(authNotifierProvider);

    final AuthNotifier authNotifier =
        useProvider(authNotifierProvider.notifier);

    final String registerSurveyID =
        useProvider(settingsProvider).data?.value.registeringSurvey ?? '';

    return FlutterLogin(
      //title: AppLiterals.title,
      //footer: AppLiterals.copyRight,
      // TODO: logo: '',
      messages: LoginMessages(
        usernameHint: "E-posta",
        passwordHint: "Şifre",
        confirmPasswordHint: "Şifreyi Onayla",
        forgotPasswordButton: "Şifremi unuttum",
        loginButton: "Giriş yap",
        signupButton: "Kaydol",
        recoverPasswordButton: "Gönder",
        recoverPasswordIntro: "Bu kısımdan şifrenizi yenileyebilirsiniz",
        recoverPasswordDescription: "Bu email'e yeni şifrenizi yollayacağız",
        goBackButton: "Geri",
        confirmPasswordError: "Şifre eşleşmedi",
        recoverPasswordSuccess: "Email gönderildi",
        flushbarTitleError: "Hata",
        flushbarTitleSuccess: "Başarılı",
        signUpSuccess: "Bir aktivasyon linki gönderildi",
      ),
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
      onSignup: (LoginData data) => authNotifier.registerUser(
          username: data.name, password: data.password),
      onLogin: (LoginData data) =>
          authNotifier.signIn(username: data.name, password: data.password),
      onRecoverPassword: (String name) =>
          authNotifier.requestPasswordRecovery(email: name),
      onSubmitAnimationCompleted: () => authScreenState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        signedUp: () => pushToPage(
          context,
          SurveyScreen(
            onCompleteSurvey: () => pushAndReplaceToPage(
              context,
              LobbyScreen(),
            ),
            surveyID: registerSurveyID,
          ),
        ),
        loggedIn: () {
          pushAndReplaceToPage(context, MainScreen());
        },
        // TODO:
        resetPassword: () => pushToPage(
            context,
            ResetPasswordWidget(
                onConfirm: (String password, String passwordConfirmation,
                        String confirmationCode) =>
                    authNotifier.recoverPassword(
                        password: password,
                        passwordConfirmation: passwordConfirmation,
                        confirmationCode: confirmationCode)
/*                    .then((value) =>
                        pushAndReplaceToPage(context, SplashScreen())),*/
                )),
        // TODO: block backward arrow button on this screen (LoginScreen breaks here).
        error: (error) => ErrorScreen(
          message: error,
          actionLabel: 'Home',
          onPressed: () => pushAndReplaceToPage(context, SplashScreen()),
        ),
        loggedOut: () => null,
      ),
    );
  }
}
