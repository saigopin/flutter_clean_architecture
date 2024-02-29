import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/styles/app_colors.dart';

class TTextFormFieldTheme {
  TTextFormFieldTheme._(); // to avoid creating instances

  /* Light Theme */
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    prefixIconColor: AppColors.grey,
    suffixIconColor: AppColors.grey,
    border: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColors.lightGrey,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColors.lightGrey,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColors.extraRed,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColors.button,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColors.extraRed,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    labelStyle: const TextStyle().copyWith(
      color: AppColors.black,
      fontWeight: FontWeight.w400,
    ),
    hintStyle: const TextStyle().copyWith(
      fontSize: 16,
      color: AppColors.textHint,
      fontWeight: FontWeight.w400,
    ),
  );

  /* Dark Theme */
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 1,
    prefixIconColor: AppColors.grey,
    suffixIconColor: AppColors.grey,
    border: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColors.white,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColors.white,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColors.extraRed,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColors.button,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderSide: BorderSide(
        color: AppColors.extraRed,
      ),
      borderRadius: BorderRadius.circular(12),
    ),
    labelStyle: const TextStyle().copyWith(
      color: AppColors.white,
      fontWeight: FontWeight.w400,
    ),
    hintStyle: const TextStyle().copyWith(
      color: AppColors.white,
      fontSize: 16,
      fontWeight: FontWeight.w400,
    ),
  );
}
