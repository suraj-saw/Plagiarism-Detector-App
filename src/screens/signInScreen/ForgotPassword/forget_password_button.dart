import 'package:flutter/material.dart';

class ForgetPasswordButton extends StatelessWidget {
  const ForgetPasswordButton(
      {super.key, this.text, this.subText, this.icon, required this.onTap});
  final String? text;
  final String? subText;
  final IconData? icon;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade400),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Icon(
            icon,
            size: 50,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$text',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              ),
              Text(
                '$subText',
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
