import 'package:flutter/material.dart';

class CustomContainerTitle extends StatelessWidget {
  const CustomContainerTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Text(
      title,
      style: TextStyle(
          color: Colors.black,
          fontSize: isLandScape ? width * 0.03 : width * 0.043,
          fontWeight: FontWeight.bold,
          fontFamily: "Sogeo UI"),
    );
  }
}
