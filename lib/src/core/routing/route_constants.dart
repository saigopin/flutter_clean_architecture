import 'package:flutter_clean_architecture/src/core/core_exports.dart';

class RouteConstants {
  static const AppRouteConfig kSplashScreen =
      AppRouteConfig(name: 'splashScreen', path: '/splashScreen');
  static const AppRouteConfig kHomeScreen =
      AppRouteConfig(name: 'homeScreen', path: '/homeScreen');
  static const AppRouteConfig kLoginScreen =
      AppRouteConfig(name: 'loginScreen', path: '/login');
  static const AppRouteConfig kSignUpScreen =
      AppRouteConfig(name: 'signUpScreen', path: '/signup');
  static const AppRouteConfig kOTPScreen =
      AppRouteConfig(name: 'otpScreen', path: '/otpscreen');
  static const AppRouteConfig kNoInternetScreen =
      AppRouteConfig(name: 'noInternetScreen', path: '/no-internet');
}
