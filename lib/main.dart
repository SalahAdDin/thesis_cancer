import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:thesis_cancer/amplifyconfiguration.dart';

enum displayState {
  SIGNED_IN,
  SHOW_CONFIRM,
  SHOW_CONFIRM_RESET,
  SHOW_CONFIRM_SIGN_IN,
  SHOW_SIGN_IN,
  SHOW_SIGN_UP,
  SHOW_UPDATE_PASSWORD,
}

void main() {
  runApp(CancerApp());
}

class CancerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Thesis Cancer',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: CancerHomePage(title: 'Thesis Cancer Home Page'),
    );
  }
}

class CancerHomePage extends StatefulWidget {
  CancerHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _CancerHomePageState createState() => _CancerHomePageState();
}

class _CancerHomePageState extends State<CancerHomePage> {
  bool _amplifyConfigured = false;

  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  bool isSignUpComplete = false;
  bool isSignedIn = false;

  @override
  initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  void dispose() {
    emailController.dispose();
    // phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _configureAmplify() async {
    if (!mounted) return;

    AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
    Amplify.addPlugins([authPlugin]);

    try {
      await Amplify.configure(amplifyconfig);
      setState(() {
        _amplifyConfigured = true;
      });
    } on AmplifyAlreadyConfiguredException {
      print(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    } catch (e) {
      print(e);
    }
  }

  Future<String> _registerUser(LoginData data) async {
    try {
      Map<String, String> userAttributes = {
        "email": emailController.text,
      // 'phone_number': phoneNumberController.text,
      };
      SignUpResult res = await Amplify.Auth.signUp(
          username: data.name,
          password: data.password,
          options: CognitoSignUpOptions(userAttributes: userAttributes));
      setState(() {
        isSignUpComplete = res.isSignUpComplete;
        print("Sign up" + (isSignUpComplete ? "Complete" : "Not Complete"));
      });
    } on AuthException catch (e) {
      print(e);
      return "Register Error: " + e.toString();
    }
  }

  Future<String> _signIn(LoginData data) async {
    try {} on AuthException catch (e) {
      print(e);
      AlertDialog(
        title: Text("Login Failed"),
        content: SingleChildScrollView(
          child: ListBody(
            children: [Text(e.message)],
          ),
        ),
        actions: <Widget>[
          TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'))
        ],
      );
      return 'Log In Error: ' + e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FlutterLogin(
          onLogin: _signIn,
          onSignup: _registerUser,
          onRecoverPassword: (_) => null,
          title: 'Flutter Amplify'),
    );
  }
}
