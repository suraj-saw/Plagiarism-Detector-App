import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({super.key, this.image, this.title, this.subTitle});
  final String? image;
  final String? title;
  final String? subTitle;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      // width: Get.width,
      child: Column(children: [
        SizedBox(
          height: Get.height * 0.05,
        ),
        Container(
          height: Get.height * 0.55,
          decoration: BoxDecoration(
              //color: Colors.yellow.shade100,
              image: DecorationImage(
            image: AssetImage('$image'),
            scale: 2.5,
          )),
        ),
        // SizedBox(
        //   height: Get.height * 0.05,
        // ),
        Container(
          height: Get.height * 0.4,
          width: Get.width,
          decoration: const BoxDecoration(
              //borderRadius: BorderRadius.circular(25),
              //color: Colors.white,
              ),
          padding: const EdgeInsets.all(30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Text('$title'),
            const SizedBox(
              height: 20,
            ),
            Text('$subTitle'),
          ]),
        )
      ]),
    );
  }
}
