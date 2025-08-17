import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:plagiarism_app/src/themes/otp_pin_theme.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    final pinTheme = TPinTheme.getPinTheme(brightness);
    return SafeArea(
        child: Scaffold(
      body: Container(
        width: Get.width,
        padding: const EdgeInsets.all(20),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text(
            "Top",
            style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          const Text("subtitle",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)),
          const SizedBox(
            height: 40,
          ),
          const Text(
            "Enter the verification code sent at" + "abc@gmail.com",
            textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w600, color: Colors.black),
          ),
          const SizedBox(
            height: 20,
          ),
          Pinput(
            length: 6,
            defaultPinTheme: pinTheme,
            pinContentAlignment: Alignment.center,
            focusedPinTheme: pinTheme.copyWith(
              decoration: pinTheme.decoration!.copyWith(
                border: Border.all(
                    color: Colors.blue,
                    width:
                        1), // Define border for focused state with desired width
              ),
            ),
            submittedPinTheme: pinTheme.copyWith(
              decoration: pinTheme.decoration!.copyWith(
                color: Colors.black.withOpacity(0.1),
              ),
            ),
            onChanged: (String code) {
              // This function is triggered on every character change, useful for validation
              print("Code changed: $code");
            },
            onCompleted: (String verificationCode) {
              print("OTP is => $verificationCode");
            },
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
                child: Text("Verify", style: TextStyle(fontSize: 20)),
                style: Theme.of(context).elevatedButtonTheme.style,
                onPressed: () {}),
          )
        ]),
      ),
    ));
  }
}
