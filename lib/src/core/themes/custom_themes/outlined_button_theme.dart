import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/core.dart';

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  static ButtonStyle getButtonStyle({required Color foregroundColor}) {
    return OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: foregroundColor,
      side: BorderSide(color: AppColors.button),
      textStyle: const TextStyle().copyWith(
        fontSize: Dimenstions.size16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimenstions.borderRadius),
      ),
    );
  }

  /* Light Theme */
  static final OutlinedButtonThemeData lightOutlinedButtonTHeme =
      OutlinedButtonThemeData(
    style: getButtonStyle(foregroundColor: AppColors.black),
  );

  /* Dark Theme */
  static final OutlinedButtonThemeData darkOutlinedButtonTHeme =
      OutlinedButtonThemeData(
    style: getButtonStyle(foregroundColor: AppColors.white),
  );
}
