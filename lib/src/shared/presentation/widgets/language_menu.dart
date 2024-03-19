import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class LanguageMenu extends StatelessWidget {
  const LanguageMenu({Key? key, required this.context}) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      onSelected: (String language) {
        if (language == 'english') {
          this.context.setLocale(const Locale('en', 'US'));
        } else if (language == 'hindi') {
          this.context.setLocale(const Locale('hi', 'IN'));
        } else if (language == 'telugu') {
          this.context.setLocale(const Locale('te', 'IN'));
        }
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        const PopupMenuItem<String>(
          value: 'english',
          child: Text('English'),
        ),
        const PopupMenuItem<String>(
          value: 'hindi',
          child: Text('Hindi'),
        ),
        const PopupMenuItem<String>(
          value: 'telugu',
          child: Text('Telugu'),
        ),
      ],
      child: const Icon(
        Icons.language,
        size: 30,
      ),
    );
  }
}
