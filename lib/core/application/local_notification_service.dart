import 'dart:convert';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:rxdart/subjects.dart';
import 'package:thesis_cancer/features/notification/domain/activityfeed.entity.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// Local Notification Service
class LocalNotificationService {
  /// Default singleton constructor.
  factory LocalNotificationService() => _localNotificationService;

  LocalNotificationService._internal();

  static final LocalNotificationService _localNotificationService =
      LocalNotificationService._internal();

  ///
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  ///
  final BehaviorSubject<ActivityFeed> didReceiveLocalNotificationSubject =
      BehaviorSubject<ActivityFeed>();

  ///
  late InitializationSettings initializationSettings;

  /// Default local notification's channel.
  static const String channelId = '123';

  ///
  static const AndroidNotificationDetails androidUserNotificationDetails =
      AndroidNotificationDetails(
    channelId,
    'User',
    "User's social life related notifications.",
    importance: Importance.high,
    priority: Priority.high,
  );

  ///
  static const AndroidNotificationDetails androidContentNotificationDetails =
      AndroidNotificationDetails(
    channelId,
    'Content',
    "Application's content notifications.",
    importance: Importance.max,
    priority: Priority.max,
  );

  ///
  static const IOSNotificationDetails iosUserNotificationDetails =
      IOSNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
    // sound: ,
    // badgeNumber: ,
    threadIdentifier: 'User',
  );

  ///
  static const IOSNotificationDetails iosContentNotificationDetails =
      IOSNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,
    // sound: ,
    // badgeNumber: ,
    threadIdentifier: 'Content',
  );

  /// Groping notifications by relational content: user.
  NotificationDetails get userNotificationDetails => const NotificationDetails(
        android: androidUserNotificationDetails,
        iOS: iosUserNotificationDetails,
      );

  /// Groping notifications by relational content: content.
  NotificationDetails get contentNotificationDetails =>
      const NotificationDetails(
        android: androidContentNotificationDetails,
        iOS: iosContentNotificationDetails,
      );

  /*
  Future<void> _requestIOSPermissions() async =>
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );

  Future<void> _requestOsXPermissions() async =>
      await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
            alert: true,
            badge: true,
            sound: true,
          );
  */

  ///
  Future<void> init() async {
    const AndroidInitializationSettings androidInitializationSettings =
        // TODO: AndroidInitializationSettings('app_icon');
        AndroidInitializationSettings('@mipmap/ic_launcher');

    final IOSInitializationSettings iosInitializationSettings =
        IOSInitializationSettings(
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    const MacOSInitializationSettings macOSInitializationSettings =
        MacOSInitializationSettings();

    initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings,
      macOS: macOSInitializationSettings,
    );

    final String currentTimeZone =
        await FlutterNativeTimezone.getLocalTimezone();

    tz.initializeTimeZones();

    tz.setLocalLocation(tz.getLocation(currentTimeZone));

    /*
    if (Platform.isIOS) {
      await _requestIOSPermissions();
    } else if (Platform.isMacOS) {
      await _requestOsXPermissions();
    }
    */
  }

  /// Work around for old iOS versions (10-).
  Future<void> onDidReceiveLocalNotification(
    int id,
    String? title,
    String? body,
    String? payload,
  ) async {
    if (payload != null) {
      final ActivityFeed feed = ActivityFeed.fromPayload(payload: payload);
      await cancelNotificationById(feed.hashCode);
      didReceiveLocalNotificationSubject.add(feed);
    }
  }

  /// On notification click callback function.
  Future<void> setOnSelectNotification(Function onSelectNotification) async =>
      flutterLocalNotificationsPlugin.initialize(
        initializationSettings,
        onSelectNotification: (String? payload) async {
          if (payload != null) {
            await onSelectNotification(payload);
          }
        },
      );

  ///
  Future<void> cancelNotificationById(int id) async =>
      flutterLocalNotificationsPlugin.cancel(id);

  ///
  Future<void> cancelAllNotifications() async =>
      flutterLocalNotificationsPlugin.cancelAll();

  /// Set's the function to do when the app is launched at clicking notifications.
  Future<void> handleApplicationWasLaunchedFromNotification(
      Function onSelectNotification) async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails != null &&
        notificationAppLaunchDetails.didNotificationLaunchApp) {
      if (notificationAppLaunchDetails.payload != null) {
        await onSelectNotification(notificationAppLaunchDetails.payload!);
      }
    }
  }

  ///
  Future<void> scheduleNotificationByWeeks({
    required ActivityFeed feed,
    required NotificationDetails notificationDetails,
    required int step,
  }) async =>
      flutterLocalNotificationsPlugin.zonedSchedule(
        feed.hashCode,
        feed.title,
        feed.description,
        tz.TZDateTime.now(tz.local).add(Duration(days: step * 7)),
        notificationDetails,
        payload: jsonEncode(feed),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
      );

  ///
  Future<void> showNotification({
    required ActivityFeed feed,
    required String message,
    required NotificationDetails notificationDetails,
  }) =>
      flutterLocalNotificationsPlugin.show(
        feed.hashCode,
        feed.title,
        feed.description,
        notificationDetails,
        payload: jsonEncode(feed),
      );
}
