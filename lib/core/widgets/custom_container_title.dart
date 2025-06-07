import 'package:flutter/material.dart';

class CustomContainerTitle extends StatelessWidget {
  const CustomContainerTitle({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return Text(
      title,
      style: TextStyle(
          color: Colors.black,
          fontSize: width * 0.045,
          fontWeight: FontWeight.bold,
          fontFamily: "Sogeo UI"),
    );
  }
}
