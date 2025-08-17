import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plagiarism_app/src/commonWidget/custom_text_form_field.dart';
import 'package:plagiarism_app/src/screens/signUpScreen/signUp_controller.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    final _formKey = GlobalKey<FormState>();
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomTextFormField(
            controller: controller.name,
            label: "Name",
            prefixIcon: Icons.person_outline_outlined,
            suffixIcon: null,
          ),
          const SizedBox(height: 5),
          CustomTextFormField(
            controller: controller.email,
            label: "E-Mail",
            prefixIcon: Icons.mail_outline_outlined,
            suffixIcon: null,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter an email';
              }
              final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
              if (!emailRegex.hasMatch(value)) {
                return 'Enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 5),
          CustomTextFormField(
            controller: controller.phone,
            label: "Phone no.",
            prefixIcon: Icons.phone_android_outlined,
            suffixIcon: null,
          ),
          const SizedBox(height: 5),
          CustomTextFormField(
            controller: controller.password,
            label: "Password",
            prefixIcon: Icons.fingerprint_outlined,
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove_red_eye_outlined),
            ),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  controller.registerUser(
                    controller.email.text.trim(),
                    controller.password.text.trim(),
                  );
                }
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: const Text(
                "SIGN UP",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
