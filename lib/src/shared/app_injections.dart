import 'package:flutter_clean_architecture/src/core/injections.dart';
import 'package:flutter_clean_architecture/src/features/auth/presentation/cubit/signin/signin_cubit.dart';
import 'package:flutter_clean_architecture/src/features/auth/presentation/cubit/signup/signup_cubit.dart';
import 'package:flutter_clean_architecture/src/shared/data/local_data/app_shared_prefs.dart';
import 'presentation/bloc/theme_switch/theme_switch_bloc.dart';
import 'presentation/cubit/cubit/internet_cubit.dart';

void initAppInjections() {
  getIt.registerLazySingleton<AppSharedPrefs>(() => AppSharedPrefs(getIt()));

  // Register ThemeSwitchBloc as a singleton
  getIt.registerFactory<ThemeSwitchBloc>(() => ThemeSwitchBloc());

  getIt.registerLazySingleton<NetworkCubit>(() => NetworkCubit());

  getIt.registerLazySingleton<SigninCubit>(() => SigninCubit());

  getIt.registerLazySingleton<SignupCubit>(() => SignupCubit());
}
