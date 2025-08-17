// import 'package:flutter/material.dart';
// import 'package:pinput/pinput.dart';

// class CustomPinTheme extends PinTheme {
//   final bool hasBorder;
//   final Color borderColor;
//   final double borderWidth;
//   final BorderRadius borderRadius;

//   CustomPinTheme({
//     this.hasBorder = false,
//     this.borderColor = Colors.transparent,
//     this.borderWidth = 0,
//     this.borderRadius = BorderRadius.zero,
//     width = 45,
//     height = 45,
//     textStyle = const TextStyle(
//       fontSize: 18,
//       color: Colors.black,
//       fontWeight: FontWeight.w500,
//     ),
//     decoration = const BoxDecoration(),
//   }) : super(
//           width: width,
//           height: height,
//           textStyle: textStyle,
//           decoration: decoration.copyWith(
//             borderRadius: borderRadius,
//             border: Border.all(color: borderColor, width: borderWidth),
//           ),
//         );
// }

// // Create instances for light and dark themes:
// final lightPinTheme = CustomPinTheme(
//   hasBorder: false, // No border for unfocused
//   borderColor: Colors.blue,
//   borderRadius: BorderRadius.circular(8),
//   borderWidth: 1, // Border width for focused
// );

// final darkPinTheme = CustomPinTheme(
//   hasBorder: false, // No border for unfocused
//   borderColor: Colors.white,

//   borderRadius: BorderRadius.circular(8),
//   borderWidth: 1, // Border width for focused
// );
