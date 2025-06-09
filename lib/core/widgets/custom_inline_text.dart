import 'package:flutter/material.dart';

class CustomInlineText extends StatelessWidget {
  const CustomInlineText(
      {required this.leftTitle,
      required this.rightTitle,
      super.key,
      this.isLight = false});

  final String leftTitle;
  final Widget rightTitle;
  final bool isLight;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          leftTitle,
          style: TextStyle(
              color: isLight ? Colors.black54 : Colors.black,
              fontSize: width * 0.045,
              fontWeight: FontWeight.bold,
              fontFamily: "Sogeo UI"),
        ),
        rightTitle
      ],
    );
  }
}
