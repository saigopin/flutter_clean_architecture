import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/dimenstions/dimenstions.dart';
import 'package:flutter_clean_architecture/src/core/styles/app_colors.dart';

class BaseElevatedButtonTheme {
  static ButtonStyle getButtonStyle(
      Color foregroundColor,
      Color backgroundColor,
      Color disabledBackgroundColor,
      Color disabledForegroundColor) {
    return ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: foregroundColor,
      backgroundColor: backgroundColor,
      disabledBackgroundColor: disabledBackgroundColor,
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
      AppColors.white,
      AppColors.button,
      AppColors.grey,
      AppColors.black,
    ),
  );

  /* Dark Theme */
  static final ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: BaseElevatedButtonTheme.getButtonStyle(
      AppColors.white,
      AppColors.button,
      AppColors.grey,
      AppColors.white,
    ),
  );
}
