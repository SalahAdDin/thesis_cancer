import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/provider.dart';
import 'package:thesis_cancer/features/auth/presentation/pages/login.dart';
import 'package:thesis_cancer/features/home/presentation/pages/main_screen.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';

class SplashScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final splashScreenState = useProvider(splashScreenProvider);
    final homeScreenNotifier = useProvider(homeScreenNotifierProvider.notifier);
    return splashScreenState.when(
        loading: () => Center(child: CircularProgressIndicator()),
        needsProfile: () => LoginScreen(),
        profileLoaded: (profileData) {
          homeScreenNotifier.setCurrentUser(profileData);
          return MainScreen();
        });
  }
}
