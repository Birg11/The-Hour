import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  bool isDarkTheme = true;

  ThemeData getTheme() {
    return isDarkTheme ? ThemeData.dark() : ThemeData.light();
  }

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }
}
