import 'package:flutter/material.dart';
import 'package:plagiarism_app/src/commonWidget/form_footer.dart';
import 'package:plagiarism_app/src/commonWidget/form_header.dart';
import 'package:plagiarism_app/src/constants/images_string.dart';
import 'package:plagiarism_app/src/screens/signInScreen/signIn_form.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: const EdgeInsets.all(25),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FormHeader(
                  image: twelcome,
                  title: "SignIn title",
                  subTitle: "SignIn subtitle",
                  caxisAlignment: CrossAxisAlignment.start,
                ),
                SizedBox(
                  height: 20,
                ),
                SignInForm(),
                SizedBox(height: 15),
                FormFooter(
                  signWith: "Sign In with Google",
                  signCondition: "Don't have an Account? ",
                  sign: "SignUp",
                ),
              ],
            )),
      ),
    ));
  }
}
