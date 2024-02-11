import 'package:flutter_clean_architecture/src/core/network/dio/dio_network.dart';
import 'package:flutter_clean_architecture/src/features/home_screen/articles_injections.dart';
import 'package:flutter_clean_architecture/src/shared/app_injections.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'loggers/app_logger.dart';

final GetIt sl = GetIt.instance;

Future<void> initInjections() async {
  await initDioInjections();
  await initAppInjections();
  await initArticleInjections();
  await initSharedPrefsInjections();
}

initSharedPrefsInjections() async {
  sl.registerSingletonAsync<SharedPreferences>(() async {
    return await SharedPreferences.getInstance();
  });
  await sl.isReady<SharedPreferences>();
}

Future<void> initDioInjections() async {
  initRootLogger();
  DioNetwork.initDio();
}
