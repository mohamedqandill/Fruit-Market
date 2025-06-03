import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Custombutton extends StatelessWidget {
  const Custombutton(
      {required this.title,
      required this.onPressed,
      required this.width,
      required this.height,
      super.key});
  final double width;
  final double height;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor.withOpacity(0.8),
            fixedSize: Size(width, height)),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ));
  }
}
