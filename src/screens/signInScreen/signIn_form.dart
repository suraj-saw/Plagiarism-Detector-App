import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plagiarism_app/src/commonWidget/custom_text_form_field.dart';
import 'package:plagiarism_app/src/screens/signInScreen/forgetPassword/forget_password_sheet.dart';
import 'package:plagiarism_app/src/screens/signUpScreen/signUp_controller.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            controller: controller.email,
            label: "E-Mail",
            prefixIcon: Icons.mail_outline_outlined,
            suffixIcon: null,
          ),
          const SizedBox(
            height: 5,
          ),
          CustomTextFormField(
              controller: controller.password,
              label: "Password",
              prefixIcon: Icons.fingerprint_outlined,
              suffixIcon: IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.remove_red_eye_outlined))),
          // const SizedBox(
          //   height: 5,
          // ),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () {
                  ForgetPasswordSheet.buildShowModalBottomSheet(context);
                },
                style: TextButton.styleFrom(
                  foregroundColor: Colors.blue,
                ),
                child: const Text(
                  "Forget Password?",
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                )),
          ),
          // const SizedBox(height: 5),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
                onPressed: () {},
                style: Theme.of(context).elevatedButtonTheme.style,
                child: const Text(
                  "SIGN IN",
                  style: TextStyle(fontSize: 18),
                )),
          ),
        ],
      ),
    );
  }
}
