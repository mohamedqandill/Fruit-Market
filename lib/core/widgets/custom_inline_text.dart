import 'package:flutter/material.dart';

class CustomInlineText extends StatelessWidget {
  const CustomInlineText(
      {required this.leftTitle, required this.rightTitle, super.key});

  final String leftTitle;
  final Widget rightTitle;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftTitle,
          style: TextStyle(
              color: Colors.black,
              fontSize: width * 0.045,
              fontWeight: FontWeight.bold,
              fontFamily: "Sogeo UI"),
        ),
        rightTitle
      ],
    );
  }
}
