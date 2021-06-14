import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/domain/constants.dart';
import 'package:thesis_cancer/core/domain/settings/schedules.entity.dart';
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
import 'package:thesis_cancer/features/survey/presentation/pages/survey_screen.dart';
import 'package:thesis_cancer/features/user/application/user.notifier.dart';
import 'package:thesis_cancer/features/user/application/user.state.dart';

/// Main Screen
class MainScreen extends HookWidget {
  /// Leads the user to its proper screen based on its status:
  ///   [UserState.isAdmin] User goes to Main Layout on Admin mode.
  ///   [UserState.unConfirmed] User goes to Lobby.
  ///   [UserState.mustSeeIntroduction] User goes to the Introductory Video.
  ///   [UserState.mustSeeTutorial] User goes to the Main Layout with the tutorial enabled.
  ///   [UserState.completed] User goes to the Main Layout
  ///   [UserState.loading] It shows a circular indicator.
  ///   [UserState.error] It shows the Error Screen with the occurred error.
  @override
  Widget build(BuildContext context) {
    final UserState currentUserState = useProvider(homeScreenNotifierProvider);
    final UserNotifier homeNotifier =
        useProvider(homeScreenNotifierProvider.notifier);
    final UploadFile introductoryVideo =
        useProvider(settingsProvider).data?.value.introductoryVideo ??
            UploadFile.empty;
    final List<SurveySchedule> scheduledSurveys =
        useProvider(settingsProvider).data?.value.surveySchedules ??
            <SurveySchedule>[];

    return currentUserState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      // TODO: Handle the main layout builder to navigate to isAdmin: () => DashBoardScreen(),
      isAdmin: () => MainLayout(),
      // TODO: how to wrap this one in a scaffold widget?
      unConfirmed: () => LobbyScreen(),
      mustSeeIntroduction: () => IntroductoryScreen(
        dataSource: introductoryVideo.url,
        onDone: () => pushToPage(
          context,
          SurveyScreen(
            onCompleteSurvey: () {
              Navigator.of(context).pop();
              homeNotifier.hasSeenIntroductoryVideo();
            },
            surveyID: scheduledSurveys
                .firstWhere(
                    (SurveySchedule element) => element.label == "control")
                .survey,
          ),
        ),
      ),
      mustSeeTutorial: () => MainLayout(),
      completed: () => MainLayout(),
      error: (String error) => ErrorScreen(
        message: error,
        actionLabel: 'Home',
        onPressed: () => pushAndReplaceToPage(context, SplashScreen()),
      ),
    );
  }
}

/// Main Layout
/// User's main screen. Shows the published posts grouped by their [PostType].
/// Enables navigation through tabs by clicking on navigation bar or swiping the view.
class MainLayout extends HookWidget {
  /// [StateProvider] which handles the current screen's viewing tab.
  final StateController<PostType> tabType = useProvider(tabTypeProvider);

  /// [Provider] for the screen's [PageView] controller.
  final PageController pageController =
      useProvider(homePageControllerProvider).state;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Header(),
      endDrawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 300),
        child: SideMenu(),
      ),
      body: SafeArea(
        child: PageView(
          controller: pageController,
          onPageChanged: (int index) => tabType.state = PostType.values[index],
          children: <Widget>[
            KnowledgeScreen(),
            TherapyScreen(),
            ResearchScreen(),
            StoriesScreen()
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabType.state.index,
        items: const <BottomNavigationBarItem>[
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
        onTap: (int index) {
          tabType.state = PostType.values[index];
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
