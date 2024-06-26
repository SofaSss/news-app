import 'package:flutter/material.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        fontSize: 16,
        fontFamily: 'Poppins',
        color: Colors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 14,
        fontFamily: 'Poppins',
        color: Colors.black,
      ),
    ),
    brightness: Brightness.light,
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blue,
  );
}

