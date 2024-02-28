import 'package:flutter_clean_architecture/src/core/network/dio/dio_network.dart';
import 'package:flutter_clean_architecture/src/core/network/dio/dio_operations.dart';
import 'package:flutter_clean_architecture/src/features/home/articles_injections.dart';
import 'package:flutter_clean_architecture/src/shared/app_injections.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loggers/app_logger.dart';

final GetIt getIt = GetIt.instance;

Future<void> initInjections() async {
  await initDioInjections();
  initAppInjections();
  initArticleInjections();
  await initSharedPrefsInjections();
}

Future<void> initSharedPrefsInjections() async {
  getIt.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await getIt.isReady<SharedPreferences>();
}

Future<void> initDioInjections() async {
  initRootLogger();
  DioNetwork.initDio();
  getIt.registerSingleton<DioOperations>(DioOperations(DioNetwork.appAPI));
}
