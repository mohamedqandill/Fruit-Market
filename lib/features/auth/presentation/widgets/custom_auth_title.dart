import 'package:flutter/material.dart';

class CustomAuthTitle extends StatelessWidget {
  const CustomAuthTitle({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Column(
      children: [
        Image.asset(
          "assets/images/Fruit Market.png",
          height: isLandScape ? height * 0.06 : 0.08,
        ),
        SizedBox(
          height: height * 0.055,
        ),
        Center(
            child: Text(
          title,
          style: TextStyle(
            fontFamily: "Sogeo UI",
            fontWeight: FontWeight.bold,
            fontSize: isLandScape ? height * 0.04 : height * 0.03,
          ),
        ))
      ],
    );
  }
}
