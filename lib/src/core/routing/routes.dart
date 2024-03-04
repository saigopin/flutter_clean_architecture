import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/exports.dart';
import 'package:flutter_clean_architecture/src/core/injections.dart';
import 'package:flutter_clean_architecture/src/core/routing/route_constants.dart';
import 'package:flutter_clean_architecture/src/features/home/presentation/pages/articles_page.dart';
import 'package:flutter_clean_architecture/src/features/splash/presentation/splash_screen.dart';
import 'package:flutter_clean_architecture/src/shared/data/local_data/app_shared_prefs.dart';
import 'package:flutter_clean_architecture/src/shared/presentation/pages/no_internet_screen.dart';
import 'package:go_router/go_router.dart';

import '../../shared/presentation/cubit/cubit/internet_cubit.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final NetworkCubit network = getIt<NetworkCubit>();

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouteConstants.kSplashScreen.path,
  debugLogDiagnostics: true,
  refreshListenable: network.connectivityStatusNotifier,
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
    GoRoute(
      name: RouteConstants.kNoInternetScreen.name,
      path: RouteConstants.kNoInternetScreen.path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return MaterialPage<dynamic>(
          key: state.pageKey,
          child: const NoInternetScreen(),
        );
      },
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) async {
    // Get the AppSharedPrefs instance using dependency injection
    final AppSharedPrefs sharedPref = getIt<AppSharedPrefs>();

    // Check if the network is disconnected
    if (network.state.status == ConnectivityStatus.disconnected) {
      // Avoid storing the 'no-internet' route to prevent redirection loop
      if (state.fullPath != RouteConstants.kNoInternetScreen.path) {
        // Store the current route path for future redirection
        sharedPref.setCurrentRoute(state.uri.path);
      }

      // Redirect to the 'no-internet' screen
      return RouteConstants.kNoInternetScreen.path;
    }

    // If connected, check for a stored route
    final String storedRoute = await sharedPref.getCurrentRoute();

    if (storedRoute.isNotEmpty) {
      // Clear the stored route after retrieving it
      sharedPref.setCurrentRoute('');
      return storedRoute; // Redirect to the stored route
    }

    // Allow the default behavior if no stored route
    return null;
  },
);
