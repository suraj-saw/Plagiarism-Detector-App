import 'package:flutter/material.dart';

class TTextFieldTheme {
  TTextFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = const InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.grey),
    // filled: true,
    // fillColor: Colors.white,
    // border: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(8),
    //   borderSide: const BorderSide(color: Colors.grey),
    // ),
    // focusedBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(8),
    //   borderSide: const BorderSide(color: Colors.green),
    // ),
    contentPadding: EdgeInsets.all(10),
  );

  static InputDecorationTheme darkInputDecorationTheme = const InputDecorationTheme(
    hintStyle: TextStyle(color: Colors.white),
    // filled: true,
    // fillColor: Colors.black12,
    // border: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(8),
    //   borderSide: const BorderSide(color: Colors.grey),
    // ),
    // focusedBorder: OutlineInputBorder(
    //   borderRadius: BorderRadius.circular(8),
    //   borderSide: const BorderSide(color: Colors.green),
    // ),
    contentPadding: EdgeInsets.all(10),
  );
}
