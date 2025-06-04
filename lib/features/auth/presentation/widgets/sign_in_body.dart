import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/routes_manager/routes.dart';
import 'package:responsive_adaptive_ui/core/widgets/customButton.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/widgets/custom_auth_title.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/widgets/custom_text.dart';

import 'custom_field.dart';
import 'custom_phone_field.dart';
import 'custom_underlined_text.dart';

class SignInBody extends StatelessWidget {
  const SignInBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var shortSide = MediaQuery.sizeOf(context).shortestSide;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double maxPadding;
    if (shortSide >= 900) {
      maxPadding = width * 0.15;
    } else if (shortSide >= 600) {
      maxPadding = width * 0.16;
    } else {
      if (isLandscape) {
        maxPadding = width * 0.14;
      } else {
        maxPadding = width * 0.03;
      }
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                  )),
              SizedBox(
                height: height * 0.06,
              ),
              const CustomAuthTitle(title: "Login To Wikala"),
              SizedBox(
                height: height * 0.025,
              ),
              const CustomPhoneField(),
              SizedBox(
                height: height * 0.003,
              ),
              const CustomField(
                title: "Password",
                label: "Password",
              ),
              SizedBox(
                height: height * 0.007,
              ),
              Padding(
                padding: EdgeInsets.only(right: maxPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomUnderlinedText(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Routes.forgetPasswordRoute);
                      },
                      text: "Forget Password?",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              Center(
                child: Custombutton(
                  title: "Login",
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: height * 0.025,
              ),
              CustomText(
                  firstString: "Don’t have an account? ",
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signupRoute);
                  },
                  secondString: "Sign Up")
            ],
          ),
        ),
      ),
    );
  }
}
