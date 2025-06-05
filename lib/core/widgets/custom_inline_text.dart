import 'package:flutter/material.dart';

class CustomInlineText extends StatelessWidget {
  const CustomInlineText(
      {required this.leftTitle, required this.rightTitle, super.key});

  final String leftTitle;
  final Widget rightTitle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftTitle,
          style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
              fontFamily: "Sogeo UI"),
        ),
        rightTitle
      ],
    );
  }
}
