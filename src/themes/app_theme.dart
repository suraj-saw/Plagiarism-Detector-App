import 'package:flutter/material.dart';
import 'package:plagiarism_app/src/themes/elevated_button_theme.dart';
import 'package:plagiarism_app/src/themes/outline_button_theme.dart';
import 'package:plagiarism_app/src/themes/text_form_field_theme.dart';
import 'package:plagiarism_app/src/themes/text_theme.dart';

class TAppTheme {
  TAppTheme._();
  static ThemeData lightThemeData = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlineButtonTheme.lightOutlineButtonTheme,
    inputDecorationTheme: TTextFormField.lightInputDecorationTheme,
  );
  static ThemeData darkThemeData = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.darkTextTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlineButtonTheme.darkOutlineButtonTheme,
    inputDecorationTheme: TTextFormField.darkInputDecorationTheme,
  );
}
