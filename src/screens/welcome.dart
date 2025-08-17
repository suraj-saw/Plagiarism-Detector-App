import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plagiarism_app/src/constants/images_string.dart';
import 'package:plagiarism_app/src/screens/signInScreen/signIn_screen.dart';
import 'package:plagiarism_app/src/screens/signUpScreen/signUp_screen.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: const EdgeInsets.all(20),
        //decoration: BoxDecoration(color: Colors.white),
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            height: 300,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(tOnBoardingPage1),
                    fit: BoxFit.contain,
                    scale: 1)),
          ),
          const Text(
            "MainText",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Text(
            "MainText",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Colors.black,
                fontStyle: FontStyle.italic),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () {
                    Get.to(const SigninScreen());
                  },
                  style: OutlinedButton.styleFrom(
                      textStyle: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      minimumSize: const Size(75, 55),
                      side: const BorderSide(
                        color: Colors.black,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: const Text("Sign In"),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(const SignupScreen());
                  },
                  style: ElevatedButton.styleFrom(
                      textStyle: const TextStyle(
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      minimumSize: const Size(75, 55),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: const Text("Sign Up"),
                ),
              ),
            ],
          )
        ]),
      ),
    ));
  }
}
