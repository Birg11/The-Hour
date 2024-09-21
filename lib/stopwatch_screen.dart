import 'package:flutter/material.dart';
import 'package:hour/dark_light_theme_toggle.dart';
import 'package:hour/stopwatch_widget.dart';
import 'package:hour/theme_provider.dart';
import 'package:provider/provider.dart';

class StopwatchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Hour',
          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
        ),
        actions: [
          Consumer<ThemeProvider>(
            builder: (context, themeProvider, child) {
              return DarkLightThemeToggle(themeProvider: themeProvider);
            },
          ),
        ],
      ),
      body: Center(
        child: StopwatchWidget(),
      ),
    );
  }
}
