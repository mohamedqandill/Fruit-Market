import 'package:flutter/material.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.015),
      child: Center(
        child: Text.rich(
          TextSpan(
            style: TextStyle(
                fontFamily: "Arial",
                fontSize: isLandScape ? width * 0.025 : width * 0.04,
                color: Colors.black38),
            text: "By continuing you agree to our ",
            children: [
              TextSpan(
                text: "Terms of Services ",
                style: TextStyle(
                    fontSize: isLandScape ? width * 0.025 : width * 0.04,
                    color: const Color(0xff235C95)),
              ),
              const TextSpan(text: "and our "),
              TextSpan(
                text: "Privacy Policy",
                style: TextStyle(
                    fontSize: isLandScape ? width * 0.025 : width * 0.04,
                    color: const Color(0xff235C95)),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
