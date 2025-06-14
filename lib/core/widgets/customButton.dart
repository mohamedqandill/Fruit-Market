import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Custombutton extends StatelessWidget {
  const Custombutton(
      {this.isSmall = false,
      required this.title,
      required this.onPressed,
      super.key,
      this.color = Colors.white,
      this.backgroungColor = Colors.green,
      this.isPrimary = true});

  final String title;

  final VoidCallback onPressed;
  final Color color;
  final Color backgroungColor;
  final isPrimary;
  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var shortSide = MediaQuery.sizeOf(context).shortestSide;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double maxWidth;
    double maxHeight;
    if (isSmall) {
      maxWidth = width * 0.35;
      maxHeight = height * 0.02;
    }
    if (shortSide >= 1200) {
      maxWidth = width * 0.85;
      maxHeight = height * 0.07;
    } else if (shortSide >= 900) {
      maxWidth = width * 0.59;
      maxHeight = height * 0.05;
    } else if (shortSide >= 600) {
      maxWidth = width * 0.6;
      maxHeight = height * 0.06;
    } else {
      if (isLandscape) {
        maxWidth = width * 0.6;
        maxHeight = height * 0.15;
      } else {
        maxWidth = width * 0.85;
        maxHeight = height * 0.065;
      }
    }
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor:
                isPrimary ? primaryColor.withOpacity(0.77) : backgroungColor,
            fixedSize: Size(maxWidth, maxHeight)),
        onPressed: onPressed,
        child: Text(
          title,
          style: TextStyle(color: color, fontSize: width * 0.05),
        ));
  }
}
