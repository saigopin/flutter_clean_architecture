import 'package:flutter_clean_architecture/src/core/injections.dart';
import 'package:flutter_clean_architecture/src/shared/data/local_data/app_shared_prefs.dart';

class Helper {
  /// Get Dio Header
  static Map<String, dynamic> getHeaders() {
    return <String, dynamic>{'token': ''};
  }

  static Future<bool> isDarkTheme() {
    return getIt<AppSharedPrefs>().getIsDarkTheme();
  }
}
