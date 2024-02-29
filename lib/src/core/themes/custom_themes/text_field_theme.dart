import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/exports.dart';

class BaseInputDecorationTheme {
  static InputDecorationTheme getInputDecorationTheme({
    required Color borderColor,
    required Color backgroundColor,
    required Color labelColor,
    required Color hintColor,
    required Color errorColor,
  }) {
    return InputDecorationTheme(
      errorMaxLines: 1,
      prefixIconColor: AppColors.grey,
      suffixIconColor: AppColors.grey,
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(Dimenstions.size12),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: borderColor,
        ),
        borderRadius: BorderRadius.circular(Dimenstions.size12),
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: errorColor,
        ),
        borderRadius: BorderRadius.circular(Dimenstions.size12),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: backgroundColor,
        ),
        borderRadius: BorderRadius.circular(Dimenstions.size12),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: errorColor,
        ),
        borderRadius: BorderRadius.circular(Dimenstions.size12),
      ),
      labelStyle: const TextStyle().copyWith(
        color: labelColor,
        fontWeight: FontWeight.w400,
      ),
      hintStyle: TextStyle(
        fontSize: 16,
        color: hintColor,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class TTextFormFieldTheme {
  TTextFormFieldTheme._(); // to avoid creating instances

  /* Light Theme */
  static InputDecorationTheme lightInputDecorationTheme =
      BaseInputDecorationTheme.getInputDecorationTheme(
    borderColor: AppColors.lightGrey,
    backgroundColor: AppColors.button,
    labelColor: AppColors.black,
    hintColor: AppColors.textHint,
    errorColor: AppColors.extraRed,
  );

  /* Dark Theme */
  static InputDecorationTheme darkInputDecorationTheme =
      BaseInputDecorationTheme.getInputDecorationTheme(
    borderColor: AppColors.white,
    backgroundColor: AppColors.button,
    labelColor: AppColors.white,
    hintColor: AppColors.white,
    errorColor: AppColors.extraRed,
  );
}
