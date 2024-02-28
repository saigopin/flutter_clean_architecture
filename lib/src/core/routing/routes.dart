import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/routing/route_constants.dart';
import 'package:flutter_clean_architecture/src/features/home/presentation/pages/articles_page.dart';
import 'package:flutter_clean_architecture/src/features/splash/presentation/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouteConstants.kSplashScreen.path,
  debugLogDiagnostics: true,
  routes: <RouteBase>[
    GoRoute(
      name: RouteConstants.kSplashScreen.name,
      path: RouteConstants.kSplashScreen.path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return MaterialPage<dynamic>(
          key: state.pageKey,
          child: const SplashScreen(),
        );
      },
    ),
    GoRoute(
      name: RouteConstants.kHomeScreen.name,
      path: RouteConstants.kHomeScreen.path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return MaterialPage<dynamic>(
          key: state.pageKey,
          child: const ArticlesPage(),
        );
      },
    ),
  ],
);
