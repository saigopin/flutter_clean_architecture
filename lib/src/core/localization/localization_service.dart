import 'dart:ui';
import 'package:easy_localization/easy_localization.dart';
// ignore: depend_on_referenced_packages, implementation_imports
import 'package:easy_logger/src/enums.dart';

class LocalizationService {
  Future<void> init() async {
    await EasyLocalization.ensureInitialized();

    EasyLocalization.logger.enableLevels = <LevelMessages>[
      LevelMessages.error,
      LevelMessages.warning
    ];
  }

  Locale getFallbackLocale() {
    return const Locale('en', 'US');
  }

  List<Locale> getSupportedLocales() {
    return <Locale>[
      const Locale('en', 'US'),
      const Locale('te', 'IN'),
      const Locale('hi', 'IN'),
    ];
  }

  String getAssetsPath() {
    return 'assets/language';
  }
}
