import 'package:flutter/material.dart';
import 'package:hour/theme_provider.dart';

class DarkLightThemeToggle extends StatelessWidget {
  final ThemeProvider themeProvider;

  DarkLightThemeToggle({required this.themeProvider});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon:
          Icon(themeProvider.isDarkTheme ? Icons.wb_sunny : Icons.brightness_2),
      onPressed: themeProvider.toggleTheme,
    );
  }
}
