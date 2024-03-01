import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/styles/app_colors.dart';
import 'package:flutter_clean_architecture/src/core/themes/custom_themes/elevated_button_theme.dart';
import 'package:flutter_clean_architecture/src/core/themes/custom_themes/outlined_button_theme.dart';
import 'package:flutter_clean_architecture/src/core/themes/custom_themes/text_field_theme.dart';
import 'package:flutter_clean_architecture/src/core/themes/custom_themes/text_theme.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: AppColors.appPrimary,
    scaffoldBackgroundColor: AppColors.white,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTHeme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: AppColors.appPrimary,
    scaffoldBackgroundColor: AppColors.black,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTHeme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
