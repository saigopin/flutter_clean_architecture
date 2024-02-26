import 'package:flutter_clean_architecture/src/core/utils/injections.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/presentation/bloc/theme_switch/theme_switch_bloc.dart';
import 'package:flutter_clean_architecture/src/shared/data/local_data/app_shared_prefs.dart';

void initAppInjections() {
  sl.registerFactory<AppSharedPrefs>(() => AppSharedPrefs(sl()));
  sl.registerFactory<ThemeSwitchBloc>(() => ThemeSwitchBloc());
}
