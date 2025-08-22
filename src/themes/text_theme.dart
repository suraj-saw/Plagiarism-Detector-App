import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TTextTheme {
  TTextTheme._();
  static TextTheme lightTextTheme = TextTheme(
      
      titleLarge: GoogleFonts.roboto(color: Colors.green, fontSize: 25),
      titleSmall: GoogleFonts.roboto(color: Colors.black, fontSize: 20),
      displayLarge: GoogleFonts.roboto(color: Colors.black, fontSize: 18),
      displayMedium: GoogleFonts.roboto(color: Colors.black, fontSize: 16),
      displaySmall: GoogleFonts.roboto(color: Colors.black, fontSize: 14)
      );
      
  static TextTheme darkTextTheme = TextTheme(
      titleLarge: GoogleFonts.roboto(color: Colors.lightGreen, fontSize: 25),
      titleSmall: GoogleFonts.roboto(color: Colors.white, fontSize: 20),
      displayLarge: GoogleFonts.roboto(color: Colors.white, fontSize: 18),
      displayMedium: GoogleFonts.roboto(color: Colors.white, fontSize: 16),
      displaySmall: GoogleFonts.roboto(color: Colors.white, fontSize: 14)
      );
}
