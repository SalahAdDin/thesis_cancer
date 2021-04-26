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
    /*AutoRoute(
        path: '/dashboard',
        // TODO: should this be removed
        page: DashBoardScreen,
        usesTabsRouter: true,
        // TODO: guards: [AuthGuard, AdminGuard], just admins can navigate here
        // TODO: initial: true, for admin users
        children: [
          AutoRoute(
              path: 'users',
              name: 'DashboardUsersRoute',
              page: EmptyRouterPage,
              children: [
                AutoRoute(path: '', page: UsersDataTable),
                AutoRoute(path: ':id', page: UserDetail),
              ]),
          AutoRoute(
              path: 'surveys',
              name: 'DashboardSurveysRoute',
              page: EmptyRouterPage,
              children: [
                AutoRoute(path: '', page: SurveysDataTable),
                AutoRoute(
                    path: ':id',
                    name: 'DashboardSurveyDetailRoute',
                    page: EmptyRouterPage,
                    children: [
                      AutoRoute(path: '', page: SurveyDetail),
                      AutoRoute(path: 'questions/:id', page: QuestionDetail),
                      AutoRoute(path: 'users/:id', page: UserAnswerDetail)
                    ]),
              ]),
          AutoRoute(path: 'app-settings', page: ApplicationSetupScreen)
          // TODO: content editor section
        ]),
    // TODO: media files AutoRoute(path: '/media', page: )
    AutoRoute(
        path: '/posts',
        name: 'PostsRouter',
        page: EmptyRouterPage,
        children: [
          AutoRoute(
              path: ':id',
              name: 'PostDetailRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute(path: '', page: PostDetail),
                AutoRoute(
                    path: 'comments',
                    name: 'PageDetailCommentsRouter',
                    page: EmptyRouterPage,
                    children: [
                      AutoRoute(path: '', page: PostComments),
                      AutoRoute(path: ':id', page: CommentDetail)
                    ])
              ]),
        ]),*/
    AutoRoute(path: '/surveys/:id', page: SurveyScreen),
    /*AutoRoute(
        path: '/users', name: 'UsersRouter', page: EmptyRouterPage, children: [
      AutoRoute(path: ':id', UserProfile),
    ])*/
  ],
)
class $AppRouter {}
