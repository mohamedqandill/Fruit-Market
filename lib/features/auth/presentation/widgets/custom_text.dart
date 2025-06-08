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
    var width = MediaQuery.sizeOf(context).width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          firstString,
          style: TextStyle(fontFamily: "ArialBold", fontSize: width * 0.04),
        ),
        InkWell(
          onTap: onPressed,
          child: Text(
            secondString,
            style: TextStyle(
                fontFamily: "Arial",
                decorationColor: Color(0xff235C95),
                fontSize: width * 0.045,
                color: Color(0xff235C95),
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
