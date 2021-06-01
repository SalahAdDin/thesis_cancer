import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/provider.logger.dart';
import 'package:thesis_cancer/core/domain/settings/settings.entity.dart';
import 'package:thesis_cancer/core/infrastructure/datastore.repository.dart';
import 'package:thesis_cancer/features/auth/presentation/pages/login_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/main_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dataStore = await SembastDataStore.makeDefault();

  runApp(ProviderScope(
      observers: [Logger()],
      overrides: [dataStoreRepositoryProvider.overrideWithValue(dataStore)],
      child: CancerApp()));
}

class CancerApp extends HookWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final navigator = useProvider(navigatorProvider);
    final Settings? appSettings = useProvider(settingsProvider).data?.value;
    final bool darkTheme = appSettings?.darkTheme ?? false;
    final launcherState = useProvider(launcherProvider);

    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);

    return MaterialApp(
        title: 'Thesis Cancer',
        theme: darkTheme ? ThemeData.dark() : ThemeData.light(),
        // navigatorKey: navigator,
        home: Builder(
          builder: (context) => launcherState.when(
              loading: () => SplashScreen(),
              needsProfile: () => LoginScreen(),
              profileLoaded: () => MainScreen()),
        ));
  }
}
