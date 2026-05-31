import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plagiarism_detector_app/src/screens/splash_screen.dart';
import 'package:plagiarism_detector_app/src/themes/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'KMP',
      debugShowCheckedModeBanner: false,
      theme: TAppTheme.lightThemeData,
      darkTheme: TAppTheme.darkThemeData,
      themeMode: ThemeMode.system,
      home: const SplashScreen(),
    );
  }
}


