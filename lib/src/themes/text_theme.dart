import 'package:flutter/material.dart';

class TTextTheme {
  TTextTheme._();
    static TextTheme lightTextTheme = const TextTheme(
        titleLarge: TextStyle(color: Colors.green, fontSize: 25),
        titleSmall: TextStyle(color: Colors.black, fontSize: 20),
        displayLarge: TextStyle(color: Colors.black, fontSize: 18),
        displayMedium: TextStyle(color: Colors.black, fontSize: 16),
        displaySmall: TextStyle(color: Colors.black, fontSize: 14),
    );
      
    static TextTheme darkTextTheme = const TextTheme(
        titleLarge: TextStyle(color: Colors.lightGreen, fontSize: 25),
        titleSmall: TextStyle(color: Colors.white, fontSize: 20),
        displayLarge: TextStyle(color: Colors.white, fontSize: 18),
        displayMedium: TextStyle(color: Colors.white, fontSize: 16),
        displaySmall: TextStyle(color: Colors.white, fontSize: 14),
    );
}