import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plagiarism_app/src/commonWidget/custom_text_form_field.dart';
import 'package:plagiarism_app/src/commonWidget/form_header.dart';
import 'package:plagiarism_app/src/constants/images_string.dart';
import 'package:plagiarism_app/src/screens/signInScreen/forgetPassword/otp_screen.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key, this.resetVia, required this.icon});
  final String? resetVia;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            const SizedBox(
              height: 30,
            ),
            const FormHeader(
              image: tForgetPassword,
              title: "Forget password title",
              subTitle: "Forget password subtitle",
              caxisAlignment: CrossAxisAlignment.center,
            ),
            const SizedBox(
              height: 25,
            ),
            CustomTextFormField(
              controller: null,
              label: '$resetVia',
              prefixIcon: icon,
              suffixIcon: null,
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    Get.to(OTPScreen());
                  },
                  style: Theme.of(context).elevatedButtonTheme.style,
                  child: const Text("Next",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ))),
            ),
            // const SizedBox(
            //   height: 5,
            // ),
            TextButton(
              onPressed: () {
                Get.back(); // Navigate back to the modal bottom sheet
              },
              child: const Text(
                "Back to options",
                style: TextStyle(fontSize: 16),
              ),
            ),
          ]),
        ),
      ),
    ));
  }
}
