import 'package:flutter_clean_architecture/src/core/routing/route_constants.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants/localdata_constants.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';

class AppSharedPrefs {
  final SecureSharedPref _preferences;
  // based on need on/off encryption
  bool enableEncryption = true;

  AppSharedPrefs(this._preferences);

  /// __________ Dark Theme __________ ///
  // get theme
  Future<bool> getIsDarkTheme() async {
    try {
      bool? response = await _preferences.getBool(
        LocalDataConstants.theme,
        isEncrypted: enableEncryption,
      );
      return response ?? false;
    } catch (e) {
      return false;
    }
  }

  // set theme mode
  void setDarkTheme(bool isDark) {
    _preferences.putBool(LocalDataConstants.theme, isDark,
        isEncrypted: enableEncryption);
  }

  /// __________ Route __________ ///
  // get current route
  Future<String> getCurrentRoute() async {
    try {
      String? response = await _preferences.getString(
        LocalDataConstants.currentRoute,
        isEncrypted: enableEncryption,
      );

      return response ?? RouteConstants.kHomeScreen.path;
    } catch (e) {
      return RouteConstants.kHomeScreen.path;
    }
  }

  // set current route
  void setCurrentRoute(String currentRoute) {
    _preferences.putString(
      LocalDataConstants.currentRoute,
      currentRoute,
      isEncrypted: enableEncryption,
    );
  }

  // set access token
  void setAccessToken(Map<String, dynamic> data) {
    _preferences.putMap(
      LocalDataConstants.accessToken,
      data,
      isEncrypted: enableEncryption,
    );
  }

  // set refresh token
  void setRefreshToken(Map<String, dynamic> data) {
    _preferences.putMap(
      LocalDataConstants.refreshToken,
      data,
      isEncrypted: enableEncryption,
    );
  }

  // get access token
  Future<Map<String, dynamic>> getAccessToken() async {
    try {
      Map<dynamic, dynamic>? response = await _preferences.getMap(
        LocalDataConstants.accessToken,
        isEncrypted: enableEncryption,
      );

      return response as Map<String, dynamic>;
    } catch (e) {
      return {};
    }
  }

// get refresh token
  Future<Map<String, dynamic>> getRefreshToken() async {
    try {
      Map<dynamic, dynamic>? response = await _preferences.getMap(
        LocalDataConstants.refreshToken,
        isEncrypted: enableEncryption,
      );

      return response as Map<String, dynamic>;
    } catch (e) {
      return {};
    }
  }
}
