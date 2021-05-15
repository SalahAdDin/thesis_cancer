import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/core/presentation/widgets/header.dart';
import 'package:thesis_cancer/core/presentation/widgets/side_menu/side_menu.dart';
import 'package:thesis_cancer/features/home/presentation/pages/introductory_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/lobby_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/splash_screen.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentUserState = useProvider(homeScreenNotifierProvider);
    return currentUserState.when(
        loading: () => Center(child: CircularProgressIndicator()),
        // TODO: Handle the main layout builder to navigate to isAdmin: () => DashBoardScreen(),
        isAdmin: () => MainLayout(),
        // TODO: how to wrap this one in a scaffold widget?
        unConfirmed: () => Scaffold(
              body: LobbyScreen(),
            ),
        mustSeeIntroduction: () => IntroductoryScreen(),
        mustSeeTutorial: () => IntroductoryScreen(),
        completed: () => MainLayout(),
        /*completed: () => HomeNavigationBuilder(
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
            ),*/
        error: (error) => ErrorScreen(
              message: error,
              actionLabel: 'Home',
              onPressed: () => pushAndReplaceToPage(context, SplashScreen()),
            ));
  }
}

class MainLayout extends HookWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Header(
        displayedUserName: 'Luis Alaguna',
      ),
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 300),
        child: SideMenu(),
      ),
      body: SafeArea(
        child: Container(),
      ),
    );
  }
}
