import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/auth/presentation/pages/login.dart';
import 'package:thesis_cancer/home/presentation/pages/home.dart';
import 'package:thesis_cancer/provider.dart';
import 'package:thesis_cancer/utils/configuration.dart';

class SplashView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final splashScreenState = useProvider(splashScreenProvider.state);
    return splashScreenState.when(
      // TODO: replace by an image.
      loading: () => Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                // color: Colors.white,
                child: const Center(child: CircularProgressIndicator()),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(AppLiterals.copyRight),
            )
          ],
        ),
      ),
      // TODO: Improve this using an image before the text or using a Snack Bar.
      // error: (err, stack) => Scaffold(
      //       appBar: AppBar(
      //         title: const Text('Error'),
      //       ),
      //     ),
      needsProfile: () => LoginScreen(),
      profileLoaded: (profileData) => HomeScreen(currentUser: profileData),
    );
  }
}
