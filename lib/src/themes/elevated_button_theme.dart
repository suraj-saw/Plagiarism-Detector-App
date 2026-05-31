import 'package:flutter/material.dart';

class TElevatedButtonTheme {
  TElevatedButtonTheme._();

  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
    elevation: 0,
    // foregroundColor: Colors.white,
    backgroundColor: Colors.green,
    //side: const BorderSide(color: Colors.white),
    // padding: const EdgeInsets.symmetric(vertical: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  ));

  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    elevation: 0,
    // foregroundColor: Colors.black,
    backgroundColor: Colors.lightGreen,
    //side: const BorderSide(color: Colors.white),
    // padding: const EdgeInsets.symmetric(vertical: 5),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
  ));
}
