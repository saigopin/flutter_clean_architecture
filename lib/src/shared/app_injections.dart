import 'package:flutter_clean_architecture/src/core/injections.dart';
import 'package:flutter_clean_architecture/src/shared/data/local_data/app_shared_prefs.dart';
import 'presentation/bloc/theme_switch/theme_switch_bloc.dart';

void initAppInjections() {
  getIt.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(getIt()));

  // Register ThemeSwitchBloc as a singleton
  getIt.registerFactory<ThemeSwitchBloc>(() => ThemeSwitchBloc());
}
