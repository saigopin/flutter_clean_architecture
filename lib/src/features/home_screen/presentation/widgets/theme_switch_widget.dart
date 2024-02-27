import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/src/core/exports.dart';
import 'package:provider/provider.dart';

class ThemeSwitchWidget extends StatelessWidget {
  const ThemeSwitchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtain the ThemeNotifier instance using Provider
    ThemeNotifier themeNotifier = Provider.of<ThemeNotifier>(context);

    return IconButton(
      onPressed: () {
        // Toggle the theme using the ThemeNotifier
        themeNotifier.toggleTheme();
      },
      icon: Icon(
        themeNotifier.darkTheme ? Icons.sunny : Icons.dark_mode_outlined,
      ),
    );
  }
}
