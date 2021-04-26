// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../../features/auth/presentation/pages/login.dart' as _i4;
import '../../../features/home/presentation/pages/home_screen.dart' as _i5;
import '../../../features/home/presentation/pages/introductory_screen.dart'
    as _i6;
import '../../../features/home/presentation/pages/knowledge_screen.dart' as _i8;
import '../../../features/home/presentation/pages/research_screen.dart' as _i10;
import '../../../features/home/presentation/pages/stories_screen.dart' as _i11;
import '../../../features/home/presentation/pages/therapy_screen.dart' as _i9;
import '../../../features/survey/presentation/pages/survey_screen.dart' as _i7;
import 'auth.guard.dart' as _i3;

class AppRouter extends _i1.RootStackRouter {
  AppRouter(
      {_i2.GlobalKey<_i2.NavigatorState>? navigatorKey,
      required this.authGuard})
      : super(navigatorKey);

  final _i3.AuthGuard authGuard;

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    LoginScreen.name: (routeData) {
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i4.LoginScreen());
    },
    HomeScreen.name: (routeData) {
      final args = routeData.argsAs<HomeScreenArgs>(
          orElse: () => const HomeScreenArgs());
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.HomeScreen(key: args.key));
    },
    IntroductoryScreen.name: (routeData) {
      final args = routeData.argsAs<IntroductoryScreenArgs>(
          orElse: () => const IntroductoryScreenArgs());
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i6.IntroductoryScreen(key: args.key));
    },
    SurveyScreen.name: (routeData) {
      final args = routeData.argsAs<SurveyScreenArgs>();
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.SurveyScreen(onCompleteSurvey: args.onCompleteSurvey));
    },
    KnowledgeScreen.name: (routeData) {
      final args = routeData.argsAs<KnowledgeScreenArgs>(
          orElse: () => const KnowledgeScreenArgs());
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i8.KnowledgeScreen(key: args.key));
    },
    TherapyScreen.name: (routeData) {
      final args = routeData.argsAs<TherapyScreenArgs>(
          orElse: () => const TherapyScreenArgs());
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i9.TherapyScreen(key: args.key));
    },
    ResearchScreen.name: (routeData) {
      final args = routeData.argsAs<ResearchScreenArgs>(
          orElse: () => const ResearchScreenArgs());
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.ResearchScreen(key: args.key));
    },
    StoriesScreen.name: (routeData) {
      final args = routeData.argsAs<StoriesScreenArgs>(
          orElse: () => const StoriesScreenArgs());
      return _i1.MaterialPageX<dynamic>(
          routeData: routeData, child: _i11.StoriesScreen(key: args.key));
    }
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(LoginScreen.name, path: '/login'),
        _i1.RouteConfig('/logout#redirect',
            path: '/logout', redirectTo: '', fullMatch: true),
        _i1.RouteConfig(HomeScreen.name, path: '/', guards: [
          authGuard
        ], children: [
          _i1.RouteConfig(KnowledgeScreen.name, path: 'knowledge'),
          _i1.RouteConfig(TherapyScreen.name, path: 'therapy'),
          _i1.RouteConfig(ResearchScreen.name, path: 'research'),
          _i1.RouteConfig(StoriesScreen.name, path: 'stories')
        ]),
        _i1.RouteConfig(IntroductoryScreen.name, path: '/introduction'),
        _i1.RouteConfig(SurveyScreen.name, path: '/surveys/:id')
      ];
}

class LoginScreen extends _i1.PageRouteInfo {
  const LoginScreen() : super(name, path: '/login');

  static const String name = 'LoginScreen';
}

class HomeScreen extends _i1.PageRouteInfo<HomeScreenArgs> {
  HomeScreen({_i2.Key? key, List<_i1.PageRouteInfo>? children})
      : super(name,
            path: '/', args: HomeScreenArgs(key: key), children: children);

  static const String name = 'HomeScreen';
}

class HomeScreenArgs {
  const HomeScreenArgs({this.key});

  final _i2.Key? key;
}

class IntroductoryScreen extends _i1.PageRouteInfo<IntroductoryScreenArgs> {
  IntroductoryScreen({_i2.Key? key})
      : super(name,
            path: '/introduction', args: IntroductoryScreenArgs(key: key));

  static const String name = 'IntroductoryScreen';
}

class IntroductoryScreenArgs {
  const IntroductoryScreenArgs({this.key});

  final _i2.Key? key;
}

class SurveyScreen extends _i1.PageRouteInfo<SurveyScreenArgs> {
  SurveyScreen({required void Function() onCompleteSurvey})
      : super(name,
            path: '/surveys/:id',
            args: SurveyScreenArgs(onCompleteSurvey: onCompleteSurvey));

  static const String name = 'SurveyScreen';
}

class SurveyScreenArgs {
  const SurveyScreenArgs({required this.onCompleteSurvey});

  final void Function() onCompleteSurvey;
}

class KnowledgeScreen extends _i1.PageRouteInfo<KnowledgeScreenArgs> {
  KnowledgeScreen({_i2.Key? key})
      : super(name, path: 'knowledge', args: KnowledgeScreenArgs(key: key));

  static const String name = 'KnowledgeScreen';
}

class KnowledgeScreenArgs {
  const KnowledgeScreenArgs({this.key});

  final _i2.Key? key;
}

class TherapyScreen extends _i1.PageRouteInfo<TherapyScreenArgs> {
  TherapyScreen({_i2.Key? key})
      : super(name, path: 'therapy', args: TherapyScreenArgs(key: key));

  static const String name = 'TherapyScreen';
}

class TherapyScreenArgs {
  const TherapyScreenArgs({this.key});

  final _i2.Key? key;
}

class ResearchScreen extends _i1.PageRouteInfo<ResearchScreenArgs> {
  ResearchScreen({_i2.Key? key})
      : super(name, path: 'research', args: ResearchScreenArgs(key: key));

  static const String name = 'ResearchScreen';
}

class ResearchScreenArgs {
  const ResearchScreenArgs({this.key});

  final _i2.Key? key;
}

class StoriesScreen extends _i1.PageRouteInfo<StoriesScreenArgs> {
  StoriesScreen({_i2.Key? key})
      : super(name, path: 'stories', args: StoriesScreenArgs(key: key));

  static const String name = 'StoriesScreen';
}

class StoriesScreenArgs {
  const StoriesScreenArgs({this.key});

  final _i2.Key? key;
}
