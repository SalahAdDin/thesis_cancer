import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
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
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/application/user.state.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

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
    final UploadFile introductoryVideo =
        useProvider(settingsNotifierProvider).introductoryVideo ??
            UploadFile.empty;
    final List<SurveySchedule> scheduledSurveys =
        useProvider(settingsNotifierProvider).surveySchedules ??
            <SurveySchedule>[];
    final UserRole currentUser =
        useProvider(userEntityProvider).state.profile?.role ?? UserRole.GUEST;

    return currentUserState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      isAdmin: () => MainLayout(),
      unConfirmed: () => LobbyScreen(),
      mustSeeIntroduction: () => IntroductoryScreen(
        dataSource: introductoryVideo.url,
        onDone: () async {
          if (currentUser == UserRole.PILOT) {
            await context
                .read(homeScreenNotifierProvider.notifier)
                .hasSeenIntroductoryVideo();
          } else {
            pushToPage(
              context,
              SurveyScreen(
                onCompleteSurvey: () async {
                  Navigator.of(context).pop();
                  await context
                      .read(homeScreenNotifierProvider.notifier)
                      .hasSeenIntroductoryVideo();
                },
                surveyID: scheduledSurveys
                    .firstWhere(
                        (SurveySchedule element) => element.label == "control")
                    .survey,
              ),
            );
          }
        },
      ),
      mustSeeTutorial: () => MainLayout(
        showTutorial: true,
      ),
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
  ///
  MainLayout({this.showTutorial = false});

  ///
  final bool showTutorial;

  ///
  final GlobalKey _knowledgeButtonKey = GlobalKey();

  ///
  final GlobalKey _treatmentButtonKey = GlobalKey();

  ///
  final GlobalKey _academyButtonKey = GlobalKey();

  ///
  final GlobalKey _successStoriesButtonKey = GlobalKey();

  ///
  final List<TargetFocus> targets = <TargetFocus>[];

  ///
  late final TutorialCoachMark tutorialCoachMark;

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;

    // [StateProvider] which handles the current screen's viewing tab.
    final StateController<PostType> tabType = useProvider(tabTypeProvider);

    // [Provider] for the screen's [PageView] controller.
    final PageController pageController =
        useProvider(homePageControllerProvider).state;

    final UserNotifier userNotifierProvider =
        useProvider(homeScreenNotifierProvider.notifier);

    if (showTutorial) {
      _initializeTargets();
      tutorialCoachMark = TutorialCoachMark(
        context,
        targets: targets,
        skipWidget: const Padding(
          padding: EdgeInsets.only(bottom: 56, right: 8),
          child: Text(
            "Skip",
            style: TextStyle(color: Colors.white),
          ),
        ),
        // onClickTarget: (TargetFocus target) => target.keyTarget.currentWidget.,
        onFinish: () async => userNotifierProvider.hasSeenTutorial(),
        onSkip: () async => userNotifierProvider.hasSeenTutorial(),
        paddingFocus: 7.5,
      )..show();
    }

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
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.book_outlined,
              key: _knowledgeButtonKey,
            ),
            label: '',
            tooltip: 'Bilgi',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.self_improvement_outlined,
              key: _treatmentButtonKey,
            ),
            label: '',
            tooltip: 'Tedavi',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.science_outlined,
              key: _academyButtonKey,
            ),
            label: '',
            tooltip: 'Geliştirmeler',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.question_answer_outlined,
              key: _successStoriesButtonKey,
            ),
            label: '',
            tooltip: 'Hikayeler',
          ),
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

  void _initializeTargets() {
    targets.addAll(
      <TargetFocus>[
        TargetFocus(
          identify: "InformationTarget",
          keyTarget: _knowledgeButtonKey,
          shape: ShapeLightFocus.Circle,
          contents: <TargetContent>[
            TargetContent(
              align: ContentAlign.top,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  Text(
                    "Bilgi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, right: 56, bottom: 56),
                    child: Text(
                      "You will find here information about cancer, treatments, side effects and advices to overcome this illness.",
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        TargetFocus(
          identify: "TreatmentTarget",
          keyTarget: _treatmentButtonKey,
          shape: ShapeLightFocus.Circle,
          contents: <TargetContent>[
            TargetContent(
              align: ContentAlign.top,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Text(
                    "Geliştirmeler",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 56),
                    child: Text(
                      "New researches and discoveries about cancer; myths and truths about cancer.",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        TargetFocus(
          identify: "AcademyTarget",
          keyTarget: _academyButtonKey,
          shape: ShapeLightFocus.Circle,
          contents: <TargetContent>[
            TargetContent(
              align: ContentAlign.top,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  Text(
                    "Tedavi",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 56),
                    child: Text(
                      "All about treatments: description, aim, etc.",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        TargetFocus(
          identify: "SuccessStoriesTarget",
          keyTarget: _successStoriesButtonKey,
          shape: ShapeLightFocus.Circle,
          contents: <TargetContent>[
            TargetContent(
              align: ContentAlign.top,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const <Widget>[
                  Text(
                    "Başarı Öyküleri",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 56, left: 56),
                    child: Text(
                      "Histories about patients which could defeat and overcome the cancer.",
                      style: TextStyle(color: Colors.white),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        /*
        TargetFocus(
      identify: "NotificationsTarget",
      keyTarget: GlobalKeys().notificationButtonKey,
      shape: ShapeLightFocus.Circle,
      contents: <TargetContent>[
        TargetContent(
          align: ContentAlign.top,
          child: Container(),
        )
      ],
    ),
    TargetFocus(
      identify: "UserButtonTarget",
      keyTarget: GlobalKeys().userNameButtonKey,
      shape: ShapeLightFocus.RRect,
      contents: <TargetContent>[
        TargetContent(
          align: ContentAlign.top,
          child: Container(),
        )
      ],
    ),
    */
      ],
    );
  }
}
