import 'package:amplify_api/amplify_api.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/infrastructure/datastore.repository.dart';
import 'package:thesis_cancer/features/home/presentation/pages/splash_screen.dart';

import 'amplifyconfiguration.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AmplifyAuthCognito authPlugin = AmplifyAuthCognito();
  AmplifyAPI apiPlugin = AmplifyAPI();
  // AmplifyStorageS3 storageS3Plugin = AmplifyStorageS3();
  // AmplifyAnalyticsPinpoint analyticsPinpointPlugin = AmplifyAnalyticsPinpoint();
  Amplify.addPlugins([
    authPlugin, apiPlugin,
    //storageS3Plugin,
    //analyticsPinpointPlugin
  ]);

  final dataStore = await SembastDataStore.makeDefault();
  try {
    await Amplify.configure(amplifyconfig);
  } on AmplifyAlreadyConfiguredException {
    print(
        "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
  } catch (e) {
    print(e);
  }
  runApp(ProviderScope(
      overrides: [dataStoreRepositoryProvider.overrideWithValue(dataStore)],
      child: CancerApp()));
}

class CancerApp extends HookWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final bool darkTheme = useProvider(darkThemeProvider);
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return MaterialApp(
        title: 'Thesis Cancer',
        theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
        home: SplashScreen());
  }
}
