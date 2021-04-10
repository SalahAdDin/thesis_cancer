import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/home/presentation/pages/introductory_screen.dart';
import 'package:thesis_cancer/home/presentation/pages/knowledge_screen.dart';
import 'package:thesis_cancer/home/presentation/pages/lobby_screen.dart';
import 'package:thesis_cancer/home/presentation/pages/research_screen.dart';
import 'package:thesis_cancer/home/presentation/pages/splash_screen.dart';
import 'package:thesis_cancer/home/presentation/pages/stories_screen.dart';
import 'package:thesis_cancer/home/presentation/pages/therapy_screen.dart';
import 'package:thesis_cancer/user/presentation/pages/dash_board_screen.dart';
import 'package:thesis_cancer/user/presentation/provider.dart';
import 'package:thesis_cancer/utils/navigator.dart';
import 'package:thesis_cancer/utils/types.dart';

import 'home_screen.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentUserState = useProvider(homeScreenProvider.state);
    return currentUserState.when(
        loading: () => Center(child: CircularProgressIndicator()),
        isAdmin: () => DashBoardScreen(),
        unConfirmed: () => LobbyScreen(),
        mustSeeIntroduction: () => IntroductoryScreen(),
        mustSeeTutorial: () => IntroductoryScreen(),
        completed: () => HomeNavigationBuilder(
              builder: (context, moduleTab) {
                if (moduleTab == ModuleTab.KNOWLEDGE) {
                  return KnowledgeScreen();
                } else if (moduleTab == ModuleTab.THERAPY) {
                  return TherapyScreen();
                } else if (moduleTab == ModuleTab.RESEARCH) {
                  return ResearchScreen();
                } else {
                  return StoriesScreen();
                }
              },
            ),
        error: (error) {
          // TODO: Does this show an error before to come back to the SplashView
          final errorSnackBar = SnackBar(
            content: Row(
              children: [
                Icon(Icons.bolt, color: Theme.of(context).errorColor),
                Text(
                  error,
                  style: TextStyle(color: Theme.of(context).errorColor),
                )
              ],
            ),
            backgroundColor: Theme.of(context).backgroundColor,
            duration: Duration(milliseconds: 1500),
            action: SnackBarAction(
              label: 'Yenileme',
              onPressed: () => pushAndReplaceToPage(context, SplashScreen()),
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(errorSnackBar);
          return Center();
        });
  }
}
