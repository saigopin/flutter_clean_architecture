import 'package:flutter_clean_architecture/src/core/utils/injections.dart';
import 'package:flutter_clean_architecture/src/shared/data/local_data/app_shared_prefs.dart';
import 'presentation/bloc/theme_switch/theme_switch_bloc.dart';

void initAppInjections() {
  sl.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(sl()));

  // Register ThemeSwitchBloc as a singleton
  sl.registerFactory<ThemeSwitchBloc>(() => ThemeSwitchBloc());
}
