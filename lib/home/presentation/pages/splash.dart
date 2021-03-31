import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/auth/presentation/pages/login.dart';
import 'package:thesis_cancer/provider.dart';

class SplashView extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final splashScreenState = useProvider(splashScreenProvider.state);
    return splashScreenState.when(
        // TODO: replace by an image.
        loading: () => Container(
              color: Colors.white,
              child: const Center(child: CircularProgressIndicator()),
            ),
        // TODO: Improve this using an image before the text or using a Snack Bar.
        // error: (err, stack) => Scaffold(
        //       appBar: AppBar(
        //         title: const Text('Error'),
        //       ),
        //     ),
        needsProfile: () => LoginScreen(),
        profileLoaded: (profileData) =>
            Scaffold(backgroundColor: Colors.white10, body: Center()));
  }
}
