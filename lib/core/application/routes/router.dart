import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:thesis_cancer/core/application/routes/auth.guard.dart';
import 'package:thesis_cancer/features/auth/presentation/pages/login.dart';
import 'package:thesis_cancer/features/home/presentation/pages/home_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/introductory_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/knowledge_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/research_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/stories_screen.dart';
import 'package:thesis_cancer/features/home/presentation/pages/therapy_screen.dart';
import 'package:thesis_cancer/features/survey/presentation/pages/survey_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(path: '/login', page: LoginScreen),
    RedirectRoute(path: '/logout', redirectTo: ''),
    AutoRoute(
        path: '/',
        // TODO: should this be removed
        page: HomeScreen,
        usesTabsRouter: true,
        guards: [AuthGuard],
        // TODO: Initial just for non admin users
        initial: true,
        children: [
          AutoRoute(path: 'knowledge', page: KnowledgeScreen),
          AutoRoute(path: 'therapy', page: TherapyScreen),
          AutoRoute(path: 'research', page: ResearchScreen),
          AutoRoute(path: 'stories', page: StoriesScreen),
        ]),
    AutoRoute(path: "/introduction", page: IntroductoryScreen),
    AutoRoute(path: '/notifications', page: NotificationsPage),
    AutoRoute(path: '/surveys/:id', page: SurveyScreen),
    /*AutoRoute(
        path: '/users', name: 'UsersRouter', page: EmptyRouterPage, children: [
      AutoRoute(path: ':id', UserProfile),
    ])*/
  ],
)
class $AppRouter {}
