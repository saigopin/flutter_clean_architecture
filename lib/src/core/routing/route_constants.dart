import 'package:flutter_clean_architecture/src/core/routing/app_route_config.dart';

class RouteConstants {
  static const AppRouteConfig kSplashScreen =
      AppRouteConfig(name: 'splashScreen', path: '/splashScreen');
  static const AppRouteConfig kHomeScreen =
      AppRouteConfig(name: 'homeScreen', path: '/homeScreen');
  static const AppRouteConfig kLoginScreen =
      AppRouteConfig(name: 'loginScreen', path: '/login');
}
