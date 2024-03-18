import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/core_exports.dart';

class BaseElevatedButtonTheme {
  static ButtonStyle getButtonStyle({required Color disabledForegroundColor}) {
    return ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.button,
      disabledBackgroundColor: AppColors.grey,
      disabledForegroundColor: disabledForegroundColor,
      side: const BorderSide(color: Colors.grey),
      textStyle: const TextStyle().copyWith(
        fontSize: Dimenstions.size16,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimenstions.borderRadius),
      ),
    );
  }
}

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  /* Light Theme */
  static final ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: BaseElevatedButtonTheme.getButtonStyle(
      disabledForegroundColor: AppColors.black,
    ),
  );

  /* Dark Theme */
  static final ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: BaseElevatedButtonTheme.getButtonStyle(
      disabledForegroundColor: AppColors.white,
    ),
  );
}
