import 'package:flutter/material.dart';

class CustomFruitContainer extends StatelessWidget {
  const CustomFruitContainer(
      {super.key,
      required this.width,
      required this.height,
      required this.image});
  final double width;
  final double height;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                color: Colors.grey, blurStyle: BlurStyle.outer, blurRadius: 1)
          ],
          border: Border.all(width: 1, color: Colors.grey.withOpacity(0.4)),
          borderRadius: BorderRadius.circular(25)),
      child: Image.asset(image),
    );
  }
}
