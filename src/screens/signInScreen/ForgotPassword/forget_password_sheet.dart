import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plagiarism_app/src/screens/signInScreen/forgetPassword/forget_password_button.dart';
import 'package:plagiarism_app/src/screens/signInScreen/forgetPassword/forget_password_screen.dart';

class ForgetPasswordSheet {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      )),
      builder: (context) => Container(
        padding: const EdgeInsets.all(30),
        //color: Colors.yellowAccent.shade100,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Make Selection",
            style: TextStyle(
                fontSize: 22, color: Colors.black, fontWeight: FontWeight.bold),
          ),
          const Text(
              "Select One of the options given below to reset your password.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  fontStyle: FontStyle.italic)),
          const SizedBox(
            height: 20,
          ),
          ForgetPasswordButton(
            onTap: () {
              Get.to(const ForgetPasswordScreen(
                resetVia: "E-Mail",
                icon: Icons.mail_outline_outlined,
              ));
            },
            icon: Icons.email_outlined,
            text: "E-mail",
            subText: "Reset via E-Mail verification",
          ),
          const SizedBox(
            height: 10,
          ),
          ForgetPasswordButton(
            onTap: () {
              Get.to(const ForgetPasswordScreen(
                resetVia: "Phone No.",
                icon: Icons.phone_android_outlined,
              ));
            },
            icon: Icons.phone_android_outlined,
            text: "Phone",
            subText: "Reset via Phone verification",
          ),
        ]),
      ),
    );
  }
}
