import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/routes_manager/routes.dart';
import 'package:responsive_adaptive_ui/core/widgets/customButton.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/widgets/custom_auth_title.dart';

import 'custom_phone_field.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

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
              const CustomAuthTitle(title: "Enter Your Number"),
              SizedBox(
                height: height * 0.025,
              ),
              const CustomPhoneField(),
              SizedBox(
                height: height * 0.025,
              ),
              Center(
                child: Custombutton(
                  title: "Submit",
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.otpRoute);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
