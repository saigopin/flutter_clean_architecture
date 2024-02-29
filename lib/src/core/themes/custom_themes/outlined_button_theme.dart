import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/styles/app_colors.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); // to avoid creating instances

  /* Light Theme */
  static final OutlinedButtonThemeData lightOutlinedButtonTHeme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.black,
      side: BorderSide(color: AppColors.button),
      textStyle: const TextStyle().copyWith(
        fontSize: 16,
        color: AppColors.black,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );

  /* Dark Theme */
  static final OutlinedButtonThemeData darkOutlinedButtonTHeme =
      OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: AppColors.white,
      side: BorderSide(color: AppColors.button),
      textStyle: const TextStyle().copyWith(
        fontSize: 16,
        color: AppColors.white,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
  );
}
