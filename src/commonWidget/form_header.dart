import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormHeader extends StatelessWidget {
  const FormHeader(
      {super.key,
      this.image,
      this.title,
      this.subTitle,
      required this.caxisAlignment});

  final String? image;
  final String? title;
  final String? subTitle;
  final CrossAxisAlignment caxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: caxisAlignment, children: [
      Image(image: AssetImage('$image'), height: Get.height * 0.2),
      const SizedBox(
        height: 12,
      ),
      Text('$title',
          style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center),
      const SizedBox(
        height: 8,
      ),
      Text(
        '$subTitle',
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        textAlign: TextAlign.center,
      ),
    ]);
  }
}
