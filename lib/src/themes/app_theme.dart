import 'package:flutter/material.dart';
import 'package:plagiarism_detector_app/src/themes/elevated_button_theme.dart';
import 'package:plagiarism_detector_app/src/themes/text_button_theme.dart';
import 'package:plagiarism_detector_app/src/themes/text_field_theme.dart';
import 'package:plagiarism_detector_app/src/themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    textButtonTheme: TTextButtonTheme.lightTextButtonTheme,
    inputDecorationTheme: TTextFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    textButtonTheme: TTextButtonTheme.darkTextButtonTheme,
    inputDecorationTheme: TTextFieldTheme.darkInputDecorationTheme,
  );
}
