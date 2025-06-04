import 'package:flutter/material.dart';

class SplashViewBody extends StatelessWidget {
  const SplashViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Image.asset(
          "assets/images/fruitsplash.png",
        ),
        Spacer(),
        Image.asset(
          "assets/images/fruitBottom.png",
        ),
      ],
    );
  }
}
