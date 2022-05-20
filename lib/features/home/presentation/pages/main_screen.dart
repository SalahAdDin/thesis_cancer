import 'package:badges/badges.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:thesis_cancer/core/application/global.provider.dart';
import 'package:thesis_cancer/core/application/navigator.dart';
import 'package:thesis_cancer/core/domain/settings/introvideo.entity.dart';
// import 'package:thesis_cancer/core/domain/constants.dart';
import 'package:thesis_cancer/core/domain/settings/schedules.entity.dart';
import 'package:thesis_cancer/core/domain/settings/settings.entity.dart';
import 'package:thesis_cancer/core/domain/types.dart';
import 'package:thesis_cancer/core/infrastructure/failure.dart';
import 'package:thesis_cancer/core/presentation/pages/error_screen.dart';
import 'package:thesis_cancer/core/presentation/widgets/header.dart';
import 'package:thesis_cancer/core/presentation/widgets/user_avatar.dart';
import 'package:thesis_cancer/features/auth/presentation/pages/lobby_screen.dart';
import 'package:thesis_cancer/features/chat/presentation/pages/rooms_page.dart';
import 'package:thesis_cancer/features/home/application/home.provider.dart';
import 'package:thesis_cancer/features/home/presentation/pages/introductory_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/knowledge_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/research_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/stories_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/therapy_screen.dart';
import 'package:thesis_cancer/features/media/domain/uploadfile.entity.dart';
import 'package:thesis_cancer/features/notification/application/activityfeed.provider.dart';
import 'package:thesis_cancer/features/notification/presentation/pages/notifications_screen.dart';
// import 'package:thesis_cancer/features/notification/presentation/pages/notifications_screen.dart';
import 'package:thesis_cancer/features/survey/presentation/pages/survey_screen.dart';
import 'package:thesis_cancer/features/user/application/user.notifier.dart';
import 'package:thesis_cancer/features/user/application/user.provider.dart';
import 'package:thesis_cancer/features/user/application/user.state.dart';
import 'package:thesis_cancer/features/user/domain/user.entity.dart';
import 'package:thesis_cancer/features/user/presentation/pages/profile_screen.dart';
import 'package:thesis_cancer/l10n/l10n.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

/// Main Screen
class MainScreen extends HookConsumerWidget {
  /// Leads the user to its proper screen based on its status:
  ///   [UserState.isAdmin] User goes to Main Layout on Admin mode.
  ///   [UserState.unConfirmed] User goes to Lobby.
  ///   [UserState.mustSeeIntroduction] User goes to the Introductory Video.
  ///   [UserState.mustSeeTutorial] User goes to the Main Layout with the tutorial enabled.
  ///   [UserState.completed] User goes to the Main Layout
  ///   [UserState.loading] It shows a circular indicator.
  ///   [UserState.error] It shows the Error Screen with the occurred error.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final UserState currentUserState = ref.watch(homeScreenNotifierProvider);
    final Settings settingsState = ref.watch(settingsNotifierProvider);
    final UserRole currentUserRole =
        ref.watch(userEntityProvider).profile?.role ?? UserRole.GUEST;
    final UploadFile introductoryVideo = settingsState.introductoryVideo
        .firstWhere(
          (IntroductoryVideo video) => video.role == currentUserRole,
          orElse: () => IntroductoryVideo.empty,
        )
        .video;
    final List<SurveySchedule> scheduledSurveys =
        settingsState.surveySchedules ?? <SurveySchedule>[];

    return currentUserState.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      isAdmin: () => MainLayout(),
      unConfirmed: (LobbyMode mode) => LobbyScreen(
        mode: mode,
      ),
      mustSeeIntroduction: () => IntroductoryScreen(
        dataSource: introductoryVideo.url,
        onDone: () async {
          if (currentUserRole == UserRole.PILOT) {
            await ref
                .read(homeScreenNotifierProvider.notifier)
                .hasSeenIntroductoryVideo();
          } else {
            pushToPage(
              Navigator.of(context),
              SurveyScreen(
                onCompleteSurvey: () async {
                  Navigator.of(context).pop();
                  await ref
                      .read(homeScreenNotifierProvider.notifier)
                      .hasSeenIntroductoryVideo();
                },
                surveyID: scheduledSurveys
                    .firstWhere(
                      (SurveySchedule survey) =>
                          EnumToString.convertToString(survey.role) ==
                              EnumToString.convertToString(currentUserRole) ||
                          survey.role == RoleOptions.ALL,
                    )
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
      error: (Failure? error) => ErrorScreen(
        reason: error?.reason,
        actionLabel: context.l10n!.homeLabel,
        onPressed: () {
          ref.read(launcherProvider.notifier).signOut();
          Navigator.of(context).maybePop();
        },
      ),
    );
  }
}

/// Main Layout
/// User's main screen. Shows the published posts grouped by their [PostType].
/// Enables navigation through tabs by clicking on navigation bar or swiping the view.
class MainLayout extends HookConsumerWidget {
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
  final GlobalKey _profileButtonKey = GlobalKey();

  ///
  final List<TargetFocus> targets = <TargetFocus>[];

  ///
  late final TutorialCoachMark tutorialCoachMark;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<PostType> tabType = useState(PostType.INFORMATION);

    final UserNotifier userNotifierProvider =
        ref.watch(homeScreenNotifierProvider.notifier);

    final StateController<User> userEntityController =
        ref.watch(userEntityProvider.state);

    final User sessionUser = userEntityController.state;

    final AsyncValue<int> notificationsCount =
        ref.watch(notificationsCountProvider);

    final List<BottomNavigationBarItem> _navigationButtons =
        <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Icon(
          Icons.book_outlined,
          key: _knowledgeButtonKey,
        ),
        label: '',
        tooltip: context.l10n!.knowledge,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.self_improvement_outlined,
          key: _treatmentButtonKey,
        ),
        label: '',
        tooltip: context.l10n!.therapy,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.science_outlined,
          key: _academyButtonKey,
        ),
        label: '',
        tooltip: context.l10n!.developments,
      ),
      BottomNavigationBarItem(
        icon: Icon(
          Icons.question_answer_outlined,
          key: _successStoriesButtonKey,
        ),
        label: '',
        tooltip: context.l10n!.successStories,
      ),
      BottomNavigationBarItem(
        icon: UserAvatar(
          userAvatarUrl: sessionUser.profile!.profilePhoto?.url,
          key: _profileButtonKey,
        ),
        label: '',
        tooltip: context.l10n!.myProfile,
      ),
    ];

    final List<Widget> pages = <Widget>[
      KnowledgeScreen(),
      TherapyScreen(),
      ResearchScreen(),
      StoriesScreen()
    ];

    final ValueNotifier<List<Widget>> visiblePages = useState(pages);

    void _refreshPages(Duration duration) => visiblePages.value = pages;

    void _swapChildren(int pageCurrent, int pageTarget) {
      final List<Widget> newVisiblePageViews = <Widget>[...pages];

      if (pageTarget > pageCurrent) {
        newVisiblePageViews[pageCurrent + 1] = visiblePages.value[pageTarget];
      } else if (pageTarget < pageCurrent) {
        newVisiblePageViews[pageCurrent - 1] = visiblePages.value[pageTarget];
      }

      visiblePages.value = newVisiblePageViews;
    }

    Future<void> _quickJump(int pageCurrent, int pageTarget) async {
      late int quickJumpTarget;

      if (pageTarget > pageCurrent) {
        quickJumpTarget = pageCurrent + 1;
      } else if (pageTarget < pageCurrent) {
        quickJumpTarget = pageCurrent - 1;
      }
      await _pageController.animateToPage(
        quickJumpTarget,
        duration: const Duration(milliseconds: 500),
        curve: Curves.ease,
      );
      _pageController.jumpToPage(pageTarget);
    }

    Future<void> _navigateOnTap(int index) async {
      if (index == 4) {
        pushToPage(
          Navigator.of(context),
          ProfileScreen(
            user: sessionUser,
          ),
        );
      } else {
        final num nearByCoefficient = (_pageController.page != null
                ? index.toDouble() - _pageController.page!
                : 0)
            .abs();
        if (nearByCoefficient > 1) {
          final int currentPage = _pageController.page!.round();
          _swapChildren(currentPage, index);
          await _quickJump(currentPage, index);
          WidgetsBinding.instance!.addPostFrameCallback(_refreshPages);
        } else {
          _pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        }
        tabType.value = PostType.values[index];
      }
    }

    void _initializeTargets() {
      targets.addAll(
        <TargetFocus>[
          TargetFocus(
            identify: TargetIdentifier.informationTarget,
            keyTarget: _knowledgeButtonKey,
            shape: ShapeLightFocus.Circle,
            contents: <TargetContent>[
              TargetContent(
                align: ContentAlign.top,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      context.l10n!.knowledge,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        right: 56,
                        bottom: 56,
                      ),
                      child: Text(
                        context.l10n!.knowledgeDescription,
                        style: const TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          TargetFocus(
            identify: TargetIdentifier.treatmentTarget,
            keyTarget: _treatmentButtonKey,
            shape: ShapeLightFocus.Circle,
            contents: <TargetContent>[
              TargetContent(
                align: ContentAlign.top,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      context.l10n!.therapy,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 56),
                      child: Text(
                        context.l10n!.therapyDescription,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          TargetFocus(
            identify: TargetIdentifier.academyTarget,
            keyTarget: _academyButtonKey,
            shape: ShapeLightFocus.Circle,
            alignSkip: Alignment.bottomRight,
            contents: <TargetContent>[
              TargetContent(
                align: ContentAlign.top,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      context.l10n!.developments,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 56),
                      child: Text(
                        context.l10n!.developmentsDescription,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          TargetFocus(
            identify: TargetIdentifier.successStoriesTarget,
            keyTarget: _successStoriesButtonKey,
            shape: ShapeLightFocus.Circle,
            alignSkip: Alignment.bottomLeft,
            contents: <TargetContent>[
              TargetContent(
                align: ContentAlign.top,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      context.l10n!.successStories,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 56,
                        left: 56,
                      ),
                      child: Text(
                        context.l10n!.successStoriesDescription,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          TargetFocus(
            identify: TargetIdentifier.sideMenuTarget,
            keyTarget: _profileButtonKey,
            shape: ShapeLightFocus.Circle,
            alignSkip: Alignment.bottomLeft,
            contents: <TargetContent>[
              TargetContent(
                align: ContentAlign.top,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      context.l10n!.myProfile,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        context.l10n!.myProfileDescription,
                        style: const TextStyle(color: Colors.white),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      );
    }

    if (showTutorial) {
      _initializeTargets();
      ref.read(firebaseAnalyticsProvider).logTutorialBegin();
      tutorialCoachMark = TutorialCoachMark(
        context,
        targets: targets,
        focusAnimationDuration: const Duration(milliseconds: 1000),
        /*
        onClickTarget: (TargetFocus target) {
          switch (target.identify as TargetIdentifier) {
            case TargetIdentifier.informationTarget:
              _navigateOnTap(0);
              break;
            case TargetIdentifier.treatmentTarget:
              _navigateOnTap(1);
              break;
            case TargetIdentifier.academyTarget:
              _navigateOnTap(2);
              break;
            case TargetIdentifier.successStoriesTarget:
              _navigateOnTap(4);
              break;
            case TargetIdentifier.sideMenuTarget:
              // TODO: Handle this case.
              break;
          }
        },
        */
        onFinish: () async {
          userNotifierProvider.hasSeenTutorial();
          ref.read(firebaseAnalyticsProvider).logTutorialComplete();
        },
        onSkip: () async => userNotifierProvider.hasSeenTutorial(),
        paddingFocus: 7.5,
      )..show();
    }

    return Scaffold(
      appBar: Header(
        additionalActions: <Widget>[
          Badge(
            animationType: BadgeAnimationType.scale,
            position: BadgePosition.topEnd(top: 7.5, end: 0),
            // TODO: watch the ActivityFeed stream controller for its list's length
            // To change the content when the length change.
            // badgeContent: BuildContext,
            // TODO: same above, if length is 0, hide the badge.
            showBadge: false,
            child: IconButton(
              icon: const Icon(Icons.chat_outlined),
              constraints: const BoxConstraints(minWidth: 10),
              iconSize: 20,
              tooltip: context.l10n!.messages,
              onPressed: () => pushToPage(Navigator.of(context), RoomsPage()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: notificationsCount.when(
              data: (int count) => Badge(
                animationType: BadgeAnimationType.scale,
                position: BadgePosition.topEnd(top: 7.5, end: 5),
                badgeContent: Text(
                  count.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 7,
                  ),
                ),
                showBadge: count > 0,
                child: IconButton(
                  // key: GlobalKeys().notificationButtonKey,
                  icon: const Icon(Icons.notifications),
                  constraints: const BoxConstraints(minWidth: 10),
                  iconSize: 20,
                  tooltip: context.l10n!.notificationsTitle,
                  onPressed: () =>
                      pushToPage(Navigator.of(context), NotificationsScreen()),
                ),
              ),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
              error: (Object error, StackTrace? stack) => const IconButton(
                onPressed: null,
                icon: Icon(Icons.error_outline),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (int index) => tabType.value = PostType.values[index],
          children: visiblePages.value,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabType.value.index,
        items: _navigationButtons,
        onTap: _navigateOnTap,
        selectedItemColor: Theme.of(context).primaryColor,
        type: BottomNavigationBarType.shifting,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}
