import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plagiarism_app/src/constants/images_string.dart';

class FormFooter extends StatelessWidget {
  const FormFooter({super.key, this.signWith, this.signCondition, this.sign});
  final String? signWith;
  final String? signCondition;
  final String? sign;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const Text(
            "OR",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            height: 50,
            width: Get.width * 0.8,
            child: OutlinedButton.icon(
              onPressed: () {},
              label: Text(
                '$signWith',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              icon: const Image(
                image: AssetImage(tGoogleLogo),
                width: 30,
              ),
              style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              )),
            ),
          ),
          TextButton(
              onPressed: () {},
              child: Text.rich(TextSpan(
                  text: '$signCondition',
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w600),
                  children: [
                    TextSpan(
                        text: '$sign',
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                  ])))
        ],
      ),
    );
  }
}
