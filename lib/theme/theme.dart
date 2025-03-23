import 'package:flutter/material.dart';

//light mode
ThemeData lightMode = ThemeData(
  // primarySwatch: Colors.blue,
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade300, //background
    primary: Colors.blue.shade200,
    secondary: Colors.blue.shade400,
    inversePrimary: Colors.blue.shade800,
  ),
);

// dark mode
ThemeData darkMode = ThemeData(
  // primarySwatch: Colors.blue,
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    surface: Colors.grey.shade800,
    primary: Colors.grey.shade900,
    secondary: Colors.grey.shade700,
    inversePrimary: Colors.grey.shade300,
  ),
);
