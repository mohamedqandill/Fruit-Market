import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/widgets/customButton.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/widgets/custom_auth_title.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/widgets/custom_text.dart';

import '../../../../core/routes_manager/routes.dart';
import 'custom_field.dart';
import 'custom_phone_field.dart';

class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

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
              const CustomAuthTitle(title: "Sign Up To Wikala"),
              SizedBox(
                height: height * 0.025,
              ),
              const CustomField(
                title: "Full Name",
                label: "First and Last Name",
              ),
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
              SizedBox(
                height: height * 0.025,
              ),
              Center(
                child: Custombutton(
                  title: "Sign Up",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.signInRoute);
                  },
                ),
              ),
              SizedBox(
                height: height * 0.05,
              ),
              CustomText(
                  firstString: "Already have an account? ",
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Routes.signInRoute);
                  },
                  secondString: "Login")
            ],
          ),
        ),
      ),
    );
  }
}
