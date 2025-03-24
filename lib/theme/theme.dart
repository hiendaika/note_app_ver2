import 'package:flutter/material.dart';

//light mode
ThemeData lightMode = ThemeData(
  // primarySwatch: Colors.blue,
  brightness: Brightness.light,
  // ColorScheme.light cung cấp bộ màu sáng
  colorScheme: ColorScheme.light(
    surface: Colors.grey.shade200,
    primary: Colors.grey.shade400,
    secondary: Colors.grey.shade600,
    inversePrimary: Colors.grey.shade800,
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

// Thuộc tính	    Ý nghĩa	                                        Ví dụ (Màu sáng)	  Ví dụ (Màu tối)
// primary	      Màu chính (thường dùng cho AppBar, nút chính)	  Colors.blue	        Colors.teal
// onPrimary	    Màu chữ/icon trên nền primary	                  Colors.white	      Colors.black
// secondary	    Màu phụ (thường dùng cho các nút phụ, tab)	    Colors.orange	      Colors.amber
// onSecondary	  Màu chữ/icon trên nền secondary	                Colors.white	      Colors.black
// background	    Màu nền chính của app	                          Colors.grey[200]!	  Colors.black
// onBackground	  Màu chữ/icon trên nền background	              Colors.black	      Colors.white
// surface	      Màu của các phần tử nổi (cards, dialogs...)	    Colors.white	      Colors.grey[900]!
// onSurface	    Màu chữ/icon trên nền surface	                  Colors.black	      Colors.white
