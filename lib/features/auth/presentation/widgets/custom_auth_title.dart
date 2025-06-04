import 'package:flutter/material.dart';

class CustomAuthTitle extends StatelessWidget {
  const CustomAuthTitle({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    return Column(
      children: [
        Image.asset("assets/images/Fruit Market.png"),
        SizedBox(
          height: height * 0.05,
        ),
        Center(
            child: Text(
          title,
          style: const TextStyle(
              fontFamily: "Sogeo UI",
              fontWeight: FontWeight.bold,
              fontSize: 28),
        ))
      ],
    );
  }
}
