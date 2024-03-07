import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/core_exports.dart';

class TAppBarTheme {
  TAppBarTheme._();

  static AppBarTheme lightAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.white,
  );

  static AppBarTheme darkAppBarTheme = AppBarTheme(
    backgroundColor: AppColors.black,
  );
}
