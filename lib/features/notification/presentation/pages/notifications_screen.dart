import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';

///
class NotificationsScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics _analytics = useProvider(firebaseAnalyticsProvider);

    Future<void> _setScreenAnalytics() async {
      await _analytics.setCurrentScreen(
        screenName: "Notifications Screen",
      );
    }

    useEffect(
      () {
        _setScreenAnalytics();
        return null;
      },
      const <Object>[],
    );

    return Container();
  }
}
