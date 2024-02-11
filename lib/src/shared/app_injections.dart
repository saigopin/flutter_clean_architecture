import 'package:flutter_clean_architecture/src/core/utils/injections.dart';
import 'package:flutter_clean_architecture/src/shared/data/local_data/app_shared_prefs.dart';


initAppInjections() {
  sl.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(sl()));
}
