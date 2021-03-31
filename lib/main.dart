import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/amplifyconfiguration.dart';
import 'package:thesis_cancer/home/infraestructure/datastore.repository.dart';
import 'package:thesis_cancer/home/presentation/pages/splash.dart';
import 'package:thesis_cancer/provider.dart';

enum displayState {
  SIGNED_IN,
  SHOW_CONFIRM,
  SHOW_CONFIRM_RESET,
  SHOW_CONFIRM_SIGN_IN,
  SHOW_SIGN_IN,
  SHOW_SIGN_UP,
  SHOW_UPDATE_PASSWORD,
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dataStore = await SembastDataStore.makeDefault();
  runApp(ProviderScope(
      overrides: [dataStoreRepositoryProvider.overrideWithValue(dataStore)],
      child: CancerApp()));
}

class CancerApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = useProvider(darkThemeProvider);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
        title: 'Thesis Cancer',
        theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
        home: SplashView());
  }
}
