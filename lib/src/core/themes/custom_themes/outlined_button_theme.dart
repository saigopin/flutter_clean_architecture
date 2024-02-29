import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/dimenstions/dimenstions.dart';
import 'package:flutter_clean_architecture/src/core/styles/app_colors.dart';

class BaseOutlinedButtonTheme {
  static ButtonStyle getButtonStyle(Color foregroundColor, Color borderColor) {
    return OutlinedButton.styleFrom(
      elevation: 0,
      foregroundColor: foregroundColor,
      side: BorderSide(color: borderColor),
      textStyle: const TextStyle().copyWith(
        fontSize: Dimenstions.size16,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(Dimenstions.borderRadius),
      ),
    );
  }
}

class TOutlinedButtonTheme {
  TOutlinedButtonTheme._();

  /* Light Theme */
  static final OutlinedButtonThemeData lightOutlinedButtonTHeme =
      OutlinedButtonThemeData(
    style: BaseOutlinedButtonTheme.getButtonStyle(
      AppColors.black,
      AppColors.button,
    ),
  );

  /* Dark Theme */
  static final OutlinedButtonThemeData darkOutlinedButtonTHeme =
      OutlinedButtonThemeData(
    style: BaseOutlinedButtonTheme.getButtonStyle(
      AppColors.white,
      AppColors.button,
    ),
  );
}
