import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:colorize/colorize.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/launcher/launcher.state.dart';
import 'package:thesis_cancer/core/application/local_notification_service.dart';
import 'package:thesis_cancer/core/application/provider.logger.dart';
import 'package:thesis_cancer/core/domain/settings/settings.entity.dart';
import 'package:thesis_cancer/core/infrastructure/datastore.repository.dart';
import 'package:thesis_cancer/core/presentation/pages/splash_screen.dart';
import 'package:thesis_cancer/core/presentation/themes.dart';
import 'package:thesis_cancer/features/auth/presentation/pages/login_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/main_screen.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.notifier.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.provider.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';
import 'package:thesis_cancer/l10n/l10n.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  if (kDebugMode) {
    print("Notifications:\nHandling a background Message ${message.messageId}");
  }
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SembastDataStore dataStore = await SembastDataStore.makeDefault();

  await LocalNotificationService().init();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

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
class CancerApp extends HookConsumerWidget {
  // This widget is the root of your application.
  final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey(debugLabel: "Main Navigator");

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    LocalNotificationService()
        .handleApplicationWasLaunchedFromNotification(_onSelectNotification);
    LocalNotificationService().setOnSelectNotification(_onSelectNotification);
    _configureDidReceiveLocalNotification();

    // final navigator = useProvider(navigatorProvider);
    final Settings? _appSettings = ref.watch(settingsNotifierProvider);
    final ThemeMode _darkTheme = _appSettings?.themeMode ?? ThemeMode.system;
    final LauncherState _launcherState = ref.watch(launcherProvider);
    final ActivityFeedNotifier _notificationProvider =
        ref.watch(notificationsProvider.notifier);
    final FirebaseAnalytics _analytics = ref.watch(firebaseAnalyticsProvider);

    late PackageInfo _packageInfo;
    late String _osName;
    late String _osVersion;

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
        _notificationProvider.requestPermissions();

        return null;
      },
      const <Object>[],
    );

    useEffect(
      () {
        final StreamSubscription<RemoteMessage> _onOpenedAppSubscription =
            FirebaseMessaging.onMessageOpenedApp
                .listen((RemoteMessage message) {
          if (kDebugMode) {
            print(
              Colorize(
                'Notifications:\nHandling a Message on Opened App ${message.toString()}',
              ).blue(),
            );
          }

          if (_notificationProvider.feedAlreadyExist(message) == false) {
            _notificationProvider.handleMessage(message);
          }

          final ActivityFeed feed = ActivityFeed.fromJson(message.data);
          /*
               TODO: here `deliverFeedAction` should return a type
                and a value or just a [String] value to send with Navigation:
                - PostType
                - SurveyId
                - UserId

                PostType: [String] to [enum] with the proper package.
                It requires ProfileProvider to request Profile with
                 userId when [User] does not have a [Profile].
                */

          _notificationProvider.deliverFeedAction(
            feed.copyWith(id: message.messageId),
            _navigatorKey.currentState!,
          );
        });
        return _onOpenedAppSubscription.cancel;
      },
      <Object>[FirebaseMessaging],
    );

    return MaterialApp(
      localizationsDelegates: const <LocalizationsDelegate<dynamic>>[
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Thesis Cancer',
      theme: lightTheme,
      darkTheme: darkTheme,
      themeMode: _darkTheme,
      navigatorKey: _navigatorKey,
      // navigatorObservers: <NavigatorObserver>[_observer],
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
  }

  Future<void> _configureDidReceiveLocalNotification() async {
    LocalNotificationService().didReceiveLocalNotificationSubject.stream.listen(
      (ActivityFeed feed) async {
        await showDialog(
          context: _navigatorKey.currentState!.context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: Text(feed.title),
            content: Text(feed.body),
            actions: <Widget>[
              CupertinoDialogAction(
                isDefaultAction: true,
                onPressed: () async => _onSelectNotification(jsonEncode(feed)),
                child: Text(context.l10n!.ok),
              )
            ],
          ),
        );
      },
    );
  }
}
