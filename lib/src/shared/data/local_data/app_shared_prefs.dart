import 'package:flutter_clean_architecture/src/core/routing/route_constants.dart';
import 'package:flutter_clean_architecture/src/core/utils/constants/localdata_constants.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';

class AppSharedPrefs {
  final SecureSharedPref _preferences;
  // based on need on/off encryption
  bool enableEncrpytion = true;

  AppSharedPrefs(this._preferences);

  /// __________ Dark Theme __________ ///
  // get theme
  Future<bool> getIsDarkTheme() async {
    bool? response = await _preferences.getBool(LocalDataConstants.theme,
        isEncrypted: enableEncrpytion);
    return response ?? false;
  }

  // set theme mode
  void setDarkTheme(bool isDark) {
    _preferences.putBool(LocalDataConstants.theme, isDark,
        isEncrypted: enableEncrpytion);
  }

  /// __________ Route __________ ///
  // get current route
  Future<String> getCurrentRoute() async {
    String? response = await _preferences.getString(
      LocalDataConstants.currentRoute,
      isEncrypted: enableEncrpytion,
    );

    return response ?? RouteConstants.kHomeScreen.path;
  }

  // set current route
  void setCurrentRoute(String currentRoute) {
    _preferences.putString(
      LocalDataConstants.currentRoute,
      currentRoute,
      isEncrypted: enableEncrpytion,
    );
  }
}
