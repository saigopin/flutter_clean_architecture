import 'package:flutter_clean_architecture/src/core/core_exports.dart';
import 'package:flutter_clean_architecture/src/features/auth/auth_exports.dart';

void initAuthInjections() {
  getIt.registerLazySingleton<SigninCubit>(() => SigninCubit());

  getIt.registerLazySingleton<SignupCubit>(() => SignupCubit());
}
