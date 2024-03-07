import 'package:flutter_clean_architecture/src/core/injections.dart';
import 'package:flutter_clean_architecture/src/shared/shared.dart';

void initAppInjections() {
  // Register AppSharedPrefs as a singleton
  getIt.registerLazySingleton<AppSharedPrefs>(() => AppSharedPrefs(getIt()));

  // Register ThemeSwitchBloc as a singleton
  getIt.registerFactory<ThemeSwitchBloc>(() => ThemeSwitchBloc());

  // Register NetworkCubit as a singleton
  getIt.registerLazySingleton<NetworkCubit>(() => NetworkCubit());
}
