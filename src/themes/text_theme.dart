import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plagiarism_app/src/constants/colors.dart';

class TTextTheme {
  TTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
      headlineLarge: GoogleFonts.robotoMono(
        color: tDarkColor,
        fontSize: 30,
      ),
      labelLarge: GoogleFonts.openSans(
        color: tDarkColor,
        fontSize: 20,
      ));
  static TextTheme darkTextTheme = TextTheme(
      headlineLarge: GoogleFonts.roboto(color: tWhiteColor, fontSize: 30),
      labelLarge: GoogleFonts.openSans(
        color: tWhiteColor,
        fontSize: 20,
      ));
}
