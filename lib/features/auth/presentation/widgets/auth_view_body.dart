import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/routes_manager/routes.dart';

import 'custom_auth_container.dart';
import 'custom_auth_title.dart';
import 'custom_text.dart';
import 'custom_text_rich.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: height * 0.15),
            const CustomAuthTitle(
              title: "Welcome to Our app",
            ),
            SizedBox(height: isLandScape ? height * 0.002 : height * 0.02),
            SizedBox(
              height: isLandScape ? height * 0.43 : height * 0.3,
              child: ListView.separated(
                separatorBuilder: (context, index) => SizedBox(
                    height: isLandScape ? height * 0.03 : height * 0.02),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return LayoutBuilder(
                    builder: (context, constraints) {
                      var widthFraction =
                          calculateWidthFraction(context, constraints);

                      return CustomAuthContainer(
                        widthFraction: widthFraction,
                        image: images[index],
                        title: titles[index],
                        color:
                            index == 2 ? const Color(0xff235C95) : Colors.white,
                        textColor: index == 2 ? Colors.white : Colors.black,
                      );
                    },
                  );
                },
              ),
            ),
            SizedBox(height: isLandScape ? height * 0.02 : height * 0.09),
            CustomText(
              onPressed: () {
                Navigator.pushNamed(context, Routes.signInRoute);
              },
              firstString: "Already Member? ",
              secondString: "Sign In",
            ),
            SizedBox(height: isLandScape ? height * 0.02 : height * 0.06),
            const CustomTextRich(),
            SizedBox(height: isLandScape ? height * 0.02 : height * 0.06),
          ],
        ),
      ),
    );
  }
}

num calculateWidthFraction(BuildContext context, BoxConstraints constraints) {
  final size = MediaQuery.of(context).size;
  final isLandscape =
      MediaQuery.of(context).orientation == Orientation.landscape;
  final shortestSide = size.shortestSide;
  num widthFraction;

  if (shortestSide < 600) {
    if (isLandscape) {
      return widthFraction = 0.45;
    } else {
      return widthFraction = 0.8;
    }
  } else if (shortestSide >= 600 && shortestSide < 900) {
    return widthFraction = 0.5;
  } else {
    return widthFraction = 0.4;
  }
}

List<String> titles = [
  "Sign in with Phone Number",
  "Sign in with Google",
  "Sign in with Facebook"
];
List<String> images = [
  "assets/images/phone.png",
  "assets/images/google.png",
  "assets/images/facebook.png",
];
