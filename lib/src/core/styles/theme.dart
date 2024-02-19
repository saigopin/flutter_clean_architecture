import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/exports.dart';

ThemeData buildThemeData({
  required BuildContext context,
  bool isDarkTheme = false,
}) =>
    isDarkTheme ? _getDarkTheme() : _getLightTheme();

ThemeData _appBaseTheme = ThemeData(
  useMaterial3: true,
);

ThemeData _getDarkTheme() {
  return _appBaseTheme.copyWith(primaryColor: AppColors.appPrimary);
}

ThemeData _getLightTheme() {
  return _appBaseTheme.copyWith(primaryColor: AppColors.appPrimary);
}
