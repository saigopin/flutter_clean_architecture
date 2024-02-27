import 'package:flutter_clean_architecture/src/core/exports.dart';
import 'package:flutter_clean_architecture/src/shared/data/local_data/app_shared_prefs.dart';
import 'package:get_it/get_it.dart';

final GetIt sl = GetIt.instance;

void initAppInjections() {
  // Register AppSharedPrefs as a singleton
  sl.registerLazySingleton<AppSharedPrefs>(() => AppSharedPrefs(sl()));

  // Register ThemeSwitchBloc as a singleton
  sl.registerFactory<ThemeSwitchBloc>(() => ThemeSwitchBloc());
}
