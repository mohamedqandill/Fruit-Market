import 'package:flutter/material.dart';

class SplashTabletView extends StatelessWidget {
  const SplashTabletView({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Spacer(),
        Center(
            child: Image.asset("assets/images/fruitsplash.png",
                width: width * 0.5)),
        Spacer(),
        Image.asset(
          "assets/images/fruitBottom.png",
          width: width * 0.5,
        ),
      ],
    );
  }
}
