import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/auth/presentation/pages/login.dart';
import 'package:thesis_cancer/home/presentation/pages/main_screen.dart';
import 'package:thesis_cancer/provider.dart';
import 'package:thesis_cancer/user/presentation/provider.dart';

class SplashScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final splashScreenState = useProvider(splashScreenProvider.state);
    return splashScreenState.when(
        loading: () => Center(child: CircularProgressIndicator()),
        needsProfile: () => LoginScreen(),
        profileLoaded: (profileData) {
          context.read(homeScreenProvider).setCurrentUser(profileData);
          context.read(homeScreenProvider).deliverUserScreen();
          return MainScreen();
        });
  }
}
