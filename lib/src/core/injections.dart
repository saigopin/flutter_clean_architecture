// ignore: depend_on_referenced_packages, implementation_imports, unused_import
import 'package:easy_logger/src/enums.dart';
import 'package:flutter_clean_architecture/src/core/core_exports.dart';
import 'package:flutter_clean_architecture/src/features/auth/auth_exports.dart';
import 'package:flutter_clean_architecture/src/features/home/home_exports.dart';
import 'package:flutter_clean_architecture/src/shared/shared_exports.dart';
import 'package:get_it/get_it.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:secure_shared_preferences/secure_shared_preferences.dart';

final GetIt getIt = GetIt.instance;

Future<void> initInjections() async {
  await initInitialInjections();
  await initDioInjections();
  await initRoutingInjections();
  initAppInjections();
  initArticleInjections();
  initAuthInjections();
  await initSharedPrefsInjections();
}

Future<void> initInitialInjections() async {
  final LocalizationService localizationService = LocalizationService();
  await localizationService.init();

  getIt.registerSingleton<LocalizationService>(localizationService);

  // created the storage variable instance to store the data in local storage
  HydratedStorage storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  // using the HydratedBloc to implement the Hydrated bloc storage
  HydratedBloc.storage = storage;
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
