import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/core/presentation/widgets/header.dart';
import 'package:thesis_cancer/core/presentation/widgets/side_menu/side_menu.dart';
import 'package:thesis_cancer/features/home/application/home.provider.dart';
import 'package:thesis_cancer/features/home/presentation/pages/introductory_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/knowledge_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/lobby_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/research_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/splash_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/stories_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/therapy_screen.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';

class MainScreen extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final currentUserState = useProvider(homeScreenNotifierProvider);
    final homeNotifier = useProvider(homeScreenNotifierProvider.notifier);
    final UploadFile introductoryVideo =
        useProvider(settingsProvider).data?.value.introductoryVideo ??
            UploadFile.empty;

    return currentUserState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      // TODO: Handle the main layout builder to navigate to isAdmin: () => DashBoardScreen(),
      isAdmin: () => MainLayout(),
      // TODO: how to wrap this one in a scaffold widget?
      unConfirmed: () => LobbyScreen(),
      mustSeeIntroduction: () => IntroductoryScreen(
        dataSource: introductoryVideo.url,
        onDone: () => homeNotifier.hasSeenIntroductoryVideo(),
      ),
      mustSeeTutorial: () => MainLayout(),
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
      ),
    );
  }
}

class MainLayout extends HookWidget {
  final tabType = useProvider(tabTypeProvider);
  final PageController pageController =
      useProvider(pageControllerProvider).state;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const Header(),
      endDrawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: SideMenu(),
      ),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          onPageChanged: (index) => tabType.state = ContentType.values[index],
          children: [
            KnowledgeScreen(),
            TherapyScreen(),
            ResearchScreen(),
            StoriesScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabType.state.index,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.book_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.self_improvement_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(Icons.science_outlined), label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.question_answer_outlined,
              ),
              label: ''),
        ],
        onTap: (index) {
          tabType.state = ContentType.values[index];
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
