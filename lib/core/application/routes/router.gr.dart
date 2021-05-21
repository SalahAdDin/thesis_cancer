// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../../features/auth/presentation/pages/login_screen.dart' as _i3;
import '../../../features/home/presentation/pages/home_screen.dart' as _i4;
import '../../../features/home/presentation/pages/introductory_screen.dart'
    as _i7;
import '../../../features/home/presentation/pages/knowledge_screen.dart'
    as _i10;
import '../../../features/home/presentation/pages/lobby_screen.dart' as _i6;
import '../../../features/home/presentation/pages/research_screen.dart' as _i12;
import '../../../features/home/presentation/pages/splash_screen.dart' as _i5;
import '../../../features/home/presentation/pages/stories_screen.dart' as _i13;
import '../../../features/home/presentation/pages/therapy_screen.dart' as _i11;
import '../../../features/notification/presentation/pages/notifications_screen.dart'
    as _i8;
import '../../../features/survey/presentation/pages/survey_screen.dart' as _i9;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.LoginScreen();
        }),
    HomeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args =
              data.argsAs<HomeRouteArgs>(orElse: () => const HomeRouteArgs());
          return _i4.HomeScreen(key: args.key);
        }),
    SplashRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.SplashScreen();
        }),
    LobbyRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i6.LobbyScreen();
        }),
    IntroductoryRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<IntroductoryRouteArgs>(
              orElse: () => const IntroductoryRouteArgs());
          return _i7.IntroductoryScreen(key: args.key);
        }),
    NotificationsRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i8.NotificationsScreen();
        }),
    SurveyRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<SurveyRouteArgs>();
          return _i9.SurveyScreen(
              onCompleteSurvey: args.onCompleteSurvey, surveyID: args.surveyID);
        }),
    KnowledgeRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<KnowledgeRouteArgs>(
              orElse: () => const KnowledgeRouteArgs());
          return _i10.KnowledgeScreen(key: args.key);
        }),
    TherapyRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<TherapyRouteArgs>(
              orElse: () => const TherapyRouteArgs());
          return _i11.TherapyScreen(key: args.key);
        }),
    ResearchRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ResearchRouteArgs>(
              orElse: () => const ResearchRouteArgs());
          return _i12.ResearchScreen(key: args.key);
        }),
    StoriesRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<StoriesRouteArgs>(
              orElse: () => const StoriesRouteArgs());
          return _i13.StoriesScreen(key: args.key);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoginRoute.name, path: '/login'),
        _i1.RouteConfig('/logout#redirect',
            path: '/logout', redirectTo: '/', fullMatch: true),
        _i1.RouteConfig('*#redirect',
            path: '*', redirectTo: '/', fullMatch: true),
        _i1.RouteConfig(HomeRoute.name, path: '/', children: [
          _i1.RouteConfig(KnowledgeRoute.name, path: 'knowledge'),
          _i1.RouteConfig(TherapyRoute.name, path: 'therapy'),
          _i1.RouteConfig(ResearchRoute.name, path: 'research'),
          _i1.RouteConfig(StoriesRoute.name, path: 'stories')
        ]),
        _i1.RouteConfig(SplashRoute.name, path: '/splash'),
        _i1.RouteConfig(LobbyRoute.name, path: '/lobby'),
        _i1.RouteConfig(IntroductoryRoute.name, path: '/introduction'),
        _i1.RouteConfig(NotificationsRoute.name, path: '/notifications'),
        _i1.RouteConfig(SurveyRoute.name, path: '/surveys/:id')
      ];
}

class LoginRoute extends _i1.PageRouteInfo {
  const LoginRoute() : super(name, path: '/login');

  static const String name = 'LoginRoute';
}

class HomeRoute extends _i1.PageRouteInfo<HomeRouteArgs> {
  HomeRoute({_i2.Key? key, List<_i1.PageRouteInfo>? children})
      : super(name,
            path: '/',
            args: HomeRouteArgs(key: key),
            initialChildren: children);

  static const String name = 'HomeRoute';
}

class HomeRouteArgs {
  const HomeRouteArgs({this.key});

  final _i2.Key? key;
}

class SplashRoute extends _i1.PageRouteInfo {
  const SplashRoute() : super(name, path: '/splash');

  static const String name = 'SplashRoute';
}

class LobbyRoute extends _i1.PageRouteInfo {
  const LobbyRoute() : super(name, path: '/lobby');

  static const String name = 'LobbyRoute';
}

class IntroductoryRoute extends _i1.PageRouteInfo<IntroductoryRouteArgs> {
  IntroductoryRoute({_i2.Key? key})
      : super(name,
            path: '/introduction', args: IntroductoryRouteArgs(key: key));

  static const String name = 'IntroductoryRoute';
}

class IntroductoryRouteArgs {
  const IntroductoryRouteArgs({this.key});

  final _i2.Key? key;
}

class NotificationsRoute extends _i1.PageRouteInfo {
  const NotificationsRoute() : super(name, path: '/notifications');

  static const String name = 'NotificationsRoute';
}

class SurveyRoute extends _i1.PageRouteInfo<SurveyRouteArgs> {
  SurveyRoute(
      {required void Function() onCompleteSurvey, required String surveyID})
      : super(name,
            path: '/surveys/:id',
            args: SurveyRouteArgs(
                onCompleteSurvey: onCompleteSurvey, surveyID: surveyID),
            rawPathParams: {'surveyID': surveyID});

  static const String name = 'SurveyRoute';
}

class SurveyRouteArgs {
  const SurveyRouteArgs(
      {required this.onCompleteSurvey, required this.surveyID});

  final void Function() onCompleteSurvey;

  final String surveyID;
}

class KnowledgeRoute extends _i1.PageRouteInfo<KnowledgeRouteArgs> {
  KnowledgeRoute({_i2.Key? key})
      : super(name, path: 'knowledge', args: KnowledgeRouteArgs(key: key));

  static const String name = 'KnowledgeRoute';
}

class KnowledgeRouteArgs {
  const KnowledgeRouteArgs({this.key});

  final _i2.Key? key;
}

class TherapyRoute extends _i1.PageRouteInfo<TherapyRouteArgs> {
  TherapyRoute({_i2.Key? key})
      : super(name, path: 'therapy', args: TherapyRouteArgs(key: key));

  static const String name = 'TherapyRoute';
}

class TherapyRouteArgs {
  const TherapyRouteArgs({this.key});

  final _i2.Key? key;
}

class ResearchRoute extends _i1.PageRouteInfo<ResearchRouteArgs> {
  ResearchRoute({_i2.Key? key})
      : super(name, path: 'research', args: ResearchRouteArgs(key: key));

  static const String name = 'ResearchRoute';
}

class ResearchRouteArgs {
  const ResearchRouteArgs({this.key});

  final _i2.Key? key;
}

class StoriesRoute extends _i1.PageRouteInfo<StoriesRouteArgs> {
  StoriesRoute({_i2.Key? key})
      : super(name, path: 'stories', args: StoriesRouteArgs(key: key));

  static const String name = 'StoriesRoute';
}

class StoriesRouteArgs {
  const StoriesRouteArgs({this.key});

  final _i2.Key? key;
}
