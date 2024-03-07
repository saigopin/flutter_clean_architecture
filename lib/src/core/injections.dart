import 'package:flutter_clean_architecture/src/core/core_exports.dart';
import 'package:flutter_clean_architecture/src/features/auth/auth_exports.dart';
import 'package:flutter_clean_architecture/src/features/home/home_exports.dart';
import 'package:flutter_clean_architecture/src/shared/shared_exports.dart';
import 'package:get_it/get_it.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> initInjections() async {
  await initDioInjections();
  await initRoutingInjections();
  initAppInjections();
  initArticleInjections();
  initAuthInjections();
  await initSharedPrefsInjections();
}

Future<void> initSharedPrefsInjections() async {
  getIt.registerSingletonAsync<SecureSharedPref>(() async {
    return await SecureSharedPref.getInstance();
  });
  await getIt.isReady<SecureSharedPref>();
}

Future<void> initDioInjections() async {
  initRootLogger();
  DioNetwork.initDio();
  getIt.registerSingleton<DioOperations>(DioOperations(DioNetwork.appAPI));
}

Future<void> initRoutingInjections() async {
  getIt.registerLazySingleton<AppRoutingAbstract>(() => AppRouting());
}
