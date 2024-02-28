import 'package:flutter_clean_architecture/src/core/network/dio/dio_network.dart';
import 'package:flutter_clean_architecture/src/core/network/dio/dio_operations.dart';
import 'package:flutter_clean_architecture/src/core/routing/app_routing.dart';
import 'package:flutter_clean_architecture/src/core/routing/app_routing_abstract/app_routing_abstract.dart';
import 'package:flutter_clean_architecture/src/features/home/articles_injections.dart';
import 'package:flutter_clean_architecture/src/shared/app_injections.dart';
import 'package:get_it/get_it.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';
import 'utils/loggers/app_logger.dart';

final GetIt getIt = GetIt.instance;

Future<void> initInjections() async {
  await initDioInjections();
  await initRoutingInjections();
  initAppInjections();
  initArticleInjections();
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
