import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/core_exports.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: AppColors.appPrimary,
    scaffoldBackgroundColor: AppColors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
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
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTHeme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
