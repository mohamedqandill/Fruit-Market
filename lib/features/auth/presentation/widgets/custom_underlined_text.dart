import 'package:flutter/material.dart';

class CustomUnderlinedText extends StatelessWidget {
  const CustomUnderlinedText(
      {required this.onPressed, required this.text, super.key});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Text(
        text,
        style: const TextStyle(
            fontSize: 18,
            fontFamily: "ArialBold",
            decoration: TextDecoration.underline,
            decorationColor: Color(0xff235C95),
            color: Color(0xff235C95)),
      ),
    );
  }
}
