import 'package:flutter_clean_architecture/src/core/exports.dart';
import 'package:flutter_clean_architecture/src/core/utils/injections.dart';
import 'package:flutter_clean_architecture/src/shared/data/local_data/app_shared_prefs.dart';

void initAppInjections() {
  getIt.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(getIt()));

  // Register ThemeSwitchBloc as a singleton
  getIt.registerFactory<ThemeSwitchBloc>(() => ThemeSwitchBloc());
}
