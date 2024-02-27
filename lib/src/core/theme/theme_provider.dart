import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/shared/data/local_data/app_shared_prefs.dart';

class ThemeNotifier extends ChangeNotifier {
  AppSharedPrefs appSharedPrefs;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme; //Getter

  ThemeNotifier(this.appSharedPrefs) {
    _darkTheme = true;
    loadFromPrefs();
  }

  void toggleTheme() {
    _darkTheme = !_darkTheme;
    saveToPrefs();
    notifyListeners();
  }

  void loadFromPrefs() {
    _darkTheme = appSharedPrefs.getIsDarkTheme();
    notifyListeners();
  }

  void saveToPrefs() {
    appSharedPrefs.setDarkTheme(_darkTheme);
  }
}
