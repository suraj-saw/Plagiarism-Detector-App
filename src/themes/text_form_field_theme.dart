import 'package:flutter/material.dart';

class TTextFormField {
  TTextFormField._();

  static InputDecorationTheme lightInputDecorationTheme =
      const InputDecorationTheme(
    prefixIconColor: Colors.black,
    suffixIconColor: Colors.black,
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
    contentPadding: EdgeInsets.symmetric(vertical: 5),
    isDense: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
  );

  static InputDecorationTheme darkInputDecorationTheme =
      const InputDecorationTheme(
    prefixIconColor: Colors.white,
    suffixIconColor: Colors.white,
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.white60)),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
    contentPadding: EdgeInsets.symmetric(vertical: 5),
    isDense: true,
    floatingLabelBehavior: FloatingLabelBehavior.never,
  );
}
