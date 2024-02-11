import 'package:flutter_clean_architecture/src/core/utils/constants/localdata_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppSharedPrefs {
  final SharedPreferences _preferences;

  AppSharedPrefs(this._preferences);

  /// __________ Dark Theme __________ ///
  // get theme
  bool getIsDarkTheme() {
    return _preferences.getBool(LocalDataConstants.theme) ?? false;
  }
  // set theme mode
  void setDarkTheme(bool isDark) {
    _preferences.setBool(LocalDataConstants.theme, isDark);
  }
}
