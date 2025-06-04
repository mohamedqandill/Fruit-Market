import 'package:flutter/material.dart';

class CustomTextRich extends StatelessWidget {
  const CustomTextRich({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Center(
        child: Text.rich(
          TextSpan(
            style: TextStyle(
                fontFamily: "Arial", fontSize: 18, color: Colors.black38),
            text: "By continuing you agree to our ",
            children: [
              TextSpan(
                text: "Terms of Services ",
                style: TextStyle(color: Color(0xff235C95)),
              ),
              TextSpan(text: "and our "),
              TextSpan(
                text: "Privacy Policy",
                style: TextStyle(color: Color(0xff235C95)),
              ),
            ],
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
