import 'package:flutter/material.dart';
import 'package:plagiarism_app/src/commonWidget/form_footer.dart';
import 'package:plagiarism_app/src/commonWidget/form_header.dart';
import 'package:plagiarism_app/src/constants/images_string.dart';
import 'package:plagiarism_app/src/screens/signUpScreen/signUp_form.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                  title: "SignUp title",
                  subTitle: "SignUp subtitle",
                  caxisAlignment: CrossAxisAlignment.start,
                ),
                SizedBox(
                    height:
                        20),

                SignUpForm(),
                SizedBox(
                  height: 15,
                ),
                FormFooter(
                  signWith: "Sign Up with Google",
                  signCondition: "Already have an Acoount? ",
                  sign: "SignIn",
                ),
              ],
            )),
      ),
    ));
  }
}
