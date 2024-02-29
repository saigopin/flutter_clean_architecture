import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/styles/app_colors.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._(); // to avoid creating instances

  /* Light Theme */
  static final ElevatedButtonThemeData lightElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.button,
      disabledBackgroundColor: AppColors.grey,
      disabledForegroundColor: AppColors.black,
      side: const BorderSide(color: Colors.grey),
      textStyle: TextStyle(
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  /* Dark Theme */
  static final ElevatedButtonThemeData darkElevatedButtonTheme =
      ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.white,
      backgroundColor: AppColors.button,
      disabledBackgroundColor: AppColors.grey,
      disabledForegroundColor: AppColors.white,
      side: const BorderSide(color: Colors.grey),
      textStyle: TextStyle(
        fontSize: 16,
        color: AppColors.white,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
