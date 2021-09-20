import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.state.dart';
import 'package:thesis_cancer/core/application/local_notification_service.dart';
import 'package:thesis_cancer/core/application/provider.logger.dart';
import 'package:thesis_cancer/core/domain/settings/settings.entity.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/infrastructure/datastore.repository.dart';
import 'package:thesis_cancer/core/presentation/themes.dart';
import 'package:thesis_cancer/features/auth/presentation/pages/login_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/main_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/splash_screen.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';
import 'package:thesis_cancer/features/survey/presentation/pages/survey_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SembastDataStore dataStore = await SembastDataStore.makeDefault();

  await LocalNotificationService().init();
  await Firebase.initializeApp();

  runApp(
    ProviderScope(
      // Provides our custom logger.
      observers: <ProviderObserver>[Logger()],
      // Injects the data store on the data store repository once
      // data store is initialized.
      overrides: <Override>[
        dataStoreRepositoryProvider.overrideWithValue(dataStore)
      ],
      child: CancerApp(),
    ),
  );
}

/// Main Application: Cancer App
class CancerApp extends HookWidget {
  // This widget is the root of your application.
  final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey(debugLabel: "Main Navigator");

  @override
  Widget build(BuildContext context) {
    LocalNotificationService()
        .handleApplicationWasLaunchedFromNotification(_onSelectNotification);
    LocalNotificationService().setOnSelectNotification(_onSelectNotification);
    _configureDidReceiveLocalNotification();

    // final navigator = useProvider(navigatorProvider);
    final Settings? _appSettings = useProvider(settingsNotifierProvider);
    final ThemeMode _darkTheme = _appSettings?.themeMode ?? ThemeMode.system;
    final LauncherState _launcherState = useProvider(launcherProvider);
    late PackageInfo _packageInfo;
    late String _osName;
    late String _osVersion;

    final FirebaseAnalytics _analytics = useProvider(firebaseAnalyticsProvider);
    final FirebaseAnalyticsObserver _observer =
        FirebaseAnalyticsObserver(analytics: _analytics);

    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: <SystemUiOverlay>[SystemUiOverlay.bottom],
    );

    Future<void> _logAppOpen() async {
      await _analytics.logAppOpen();
    }

    Future<void> _setDeviceProperties() async {
      _packageInfo = await PackageInfo.fromPlatform();

      if (Platform.isAndroid) {
        final AndroidDeviceInfo _deviceInfo =
            await DeviceInfoPlugin().androidInfo;
        _osName = "Android";
        _osVersion =
            "${_deviceInfo.version.release} (SDK ${_deviceInfo.version.sdkInt})";
      }

      if (Platform.isIOS) {
        final IosDeviceInfo _deviceInfo = await DeviceInfoPlugin().iosInfo;
        _osName = _deviceInfo.systemName ?? 'iOS';
        _osVersion = _deviceInfo.systemVersion ?? '';
      }

      await _analytics.setUserProperty(
        name: "platform",
        value: _osName,
      );
      await _analytics.setUserProperty(
        name: "appVersion",
        value: _packageInfo.version,
      );
      await _analytics.setUserProperty(
        name: "appBuild",
        value: _packageInfo.buildNumber,
      );
      await _analytics.setUserProperty(
        name: "osVersion",
        value: _osVersion,
      );
    }

    useEffect(
      () {
        _logAppOpen();
        _setDeviceProperties();
      },
      const <Object>[],
    );

    return MaterialApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const <Locale>[
        Locale('en', ''), // English, no country code
        Locale('tr', ''), // Turkish, no country code
      ],
      title: 'Thesis Cancer',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _darkTheme,
      navigatorKey: _navigatorKey,
      navigatorObservers: <NavigatorObserver>[_observer],
      debugShowCheckedModeBanner: false,
      home: Builder(
        builder: (BuildContext context) => _launcherState.when(
          loading: () => SplashScreen(),
          needsProfile: () => LoginScreen(),
          profileLoaded: () => MainScreen(),
        ),
      ),
    );
  }

  Future<void> _onSelectNotification(String payload) async {
    final ActivityFeed feed = ActivityFeed.fromPayload(payload: payload);
    await LocalNotificationService().cancelNotificationById(feed.hashCode);
    await LocalNotificationService().updateBadgeCount();

    switch (feed.type) {
      case ActivityType.NEW_COMMENT:
        // TODO: Handle this case.
        break;
      case ActivityType.NEW_FOLLOW:
        // TODO: Handle this case.
        break;
      case ActivityType.NEW_LIKE:
        // TODO: Handle this case.
        break;
      case ActivityType.NEW_POST:
        // TODO: Handle this case.
        break;
      case ActivityType.NEW_SURVEY_SCHEDULED:
        _navigatorKey.currentState!.push(
          MaterialPageRoute<Widget>(
            builder: (_) => SurveyScreen(
              onCompleteSurvey: () => _navigatorKey.currentState!.pop(),
              surveyID: feed.issuerID,
            ),
          ),
        );
        break;
      case ActivityType.NEW_RECOMMENDATION:
        // TODO: Handle this case.
        break;
      case ActivityType.NEW_REGISTERED_USER:
        // TODO: Handle this case.
        break;
    }
  }

  Future<void> _configureDidReceiveLocalNotification() async {
    LocalNotificationService().didReceiveLocalNotificationSubject.stream.listen(
      (ActivityFeed feed) async {
        await showDialog(
          context: _navigatorKey.currentState!.context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text(feed.title),
            content: Text(feed.description),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () async => _onSelectNotification(jsonEncode(feed)),
                child: Text(AppLocalizations.of(context)!.ok),
              )
            ],
          ),
        );
      },
    );
  }
}
