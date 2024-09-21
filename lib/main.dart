import 'package:flutter/material.dart';
import 'package:hour/launch_screen.dart';
import 'package:hour/stopwatch_provider.dart';
import 'package:hour/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<StopwatchProvider>(
          create: (context) => StopwatchProvider(),
        ),
        ChangeNotifierProvider<ThemeProvider>(
          create: (context) => ThemeProvider(),
        ),
      ],
      child: HourApp(),
    ),
  );
}

class HourApp extends StatelessWidget {
  const HourApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hour',
      theme: Provider.of<ThemeProvider>(context).getTheme(),
      home: LaunchScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
