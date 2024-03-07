import 'package:flutter_clean_architecture/src/core/core.dart';
import 'package:flutter_clean_architecture/src/features/auth/auth.dart';

void initAuthInjections() {
  getIt.registerLazySingleton<SigninCubit>(() => SigninCubit());

  getIt.registerLazySingleton<SignupCubit>(() => SignupCubit());
}
