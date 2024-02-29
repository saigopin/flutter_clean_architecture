import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/dimenstions/dimenstions.dart';
import 'package:flutter_clean_architecture/src/core/styles/app_colors.dart';

class TTextTheme {
  TTextTheme._(); // to avoid creating instances

  static const TextStyle _commonTextStyle = TextStyle(
    fontWeight: FontWeight.bold,
  );

  /* Light Theme */
  static TextTheme lightTextTheme = TextTheme(
    headlineLarge: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size32,
      color: AppColors.black,
    ),
    headlineMedium: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size24,
      color: AppColors.black,
    ),
    headlineSmall: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size24,
      color: AppColors.black,
    ),
    titleLarge: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size16,
      color: AppColors.black,
    ),
    titleMedium: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size16,
      color: AppColors.black,
    ),
    titleSmall: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size16,
      color: AppColors.black,
    ),
    bodyLarge: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size14,
      color: AppColors.black,
    ),
    bodySmall: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size14,
      color: AppColors.black,
    ),
    labelLarge: _commonTextStyle.copyWith(
      fontSize: 12.0,
      color: AppColors.black,
    ),
    labelMedium: _commonTextStyle.copyWith(
      fontSize: 12.0,
      color: AppColors.black,
    ),
    labelSmall: _commonTextStyle.copyWith(
      fontSize: 12.0,
      color: AppColors.black,
    ),
  );

  /* Dark Theme */
  static TextTheme darkTextTheme = TextTheme(
    headlineLarge: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size32,
      color: AppColors.white,
    ),
    headlineMedium: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size24,
      color: AppColors.white,
    ),
    headlineSmall: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size24,
      color: AppColors.white,
    ),
    titleLarge: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size16,
      color: AppColors.white,
    ),
    titleMedium: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size16,
      color: AppColors.white,
    ),
    titleSmall: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size16,
      color: AppColors.white,
    ),
    bodyLarge: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size14,
      color: AppColors.white,
    ),
    bodySmall: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size14,
      color: AppColors.white,
    ),
    labelLarge: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size12,
      color: AppColors.white,
    ),
    labelMedium: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size12,
      color: AppColors.white,
    ),
    labelSmall: _commonTextStyle.copyWith(
      fontSize: Dimenstions.size12,
      color: AppColors.white,
    ),
  );
}
