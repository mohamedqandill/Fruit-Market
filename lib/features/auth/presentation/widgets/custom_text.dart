import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText(
      {required this.firstString,
      required this.onPressed,
      required this.secondString,
      super.key});
  final String firstString;
  final String secondString;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstString,
          style: const TextStyle(fontFamily: "ArialBold", fontSize: 18),
        ),
        InkWell(
          onTap: onPressed,
          child: Text(
            secondString,
            style: const TextStyle(
                fontFamily: "Arial",
                decorationColor: Color(0xff235C95),
                fontSize: 18,
                color: Color(0xff235C95),
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
