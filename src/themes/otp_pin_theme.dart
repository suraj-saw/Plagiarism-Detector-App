import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class TPinTheme {
  TPinTheme._();

  // Light theme pin
  static PinTheme lightPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5));

  // Dark theme pin
  static PinTheme darkPinTheme = PinTheme(
      width: 50,
      height: 50,
      textStyle: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.white, width: 1),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 5));

  // Function to get PinTheme based on theme mode
  static PinTheme getPinTheme(Brightness brightness) {
    return brightness == Brightness.dark ? darkPinTheme : lightPinTheme;
  }
}
