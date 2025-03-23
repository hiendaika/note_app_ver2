import 'package:flutter/material.dart';
import 'package:note_app_ver2/theme/theme.dart';

class ThemeProvider with ChangeNotifier {
  //Init theme
  ThemeData _themeData = lightMode;

  ThemeData get themeData => _themeData;

  //Change theme
  void toggleTheme(bool isDark) {
    _themeData = isDark ? darkMode : lightMode;
    notifyListeners();
  }
}
