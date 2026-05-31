import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plagiarism_detector_app/src/screens/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), (() {
      Get.to(() => const HomeScreen());
    }));
    return SafeArea(
      child: Scaffold(
          body: Container(
        height: Get.height,
        width: Get.width,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: const Alignment(0.8, 1),
          colors: <Color>[
            Colors.green.shade700,
            Colors.green.shade500,
            Colors.greenAccent.shade700,
            Colors.greenAccent.shade400,
            Colors.green.shade300,
          ],
          tileMode: TileMode.mirror,
        )),
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/logo.png"),
              scale: 4,
            )),
          ),
        ),
      )),
    );
  }
}
