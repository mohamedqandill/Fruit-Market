import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:responsive_adaptive_ui/core/routes_manager/routes.dart';
import 'package:responsive_adaptive_ui/core/widgets/customButton.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/widgets/custom_auth_title.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/widgets/custom_text.dart';

class OtpBody extends StatefulWidget {
  const OtpBody({super.key});

  @override
  State<OtpBody> createState() => _OtpBodyState();
}

class _OtpBodyState extends State<OtpBody> {
  int seconds = 60;
  late Timer timer;
  @override
  void initState() {
    startTimer();

    super.initState();
  }

  startTimer() {
    timer = Timer.periodic(
      Duration(seconds: 1),
      (timer) {
        if (seconds == 0) {
          timer.cancel();
        } else {
          setState(() {
            seconds--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

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
              const CustomAuthTitle(title: "Enter Received OTP"),
              SizedBox(
                height: height * 0.035,
              ),
              Center(
                child: OtpTextField(
                  numberOfFields: 4,
                  borderColor: Colors.grey,
                  focusedBorderColor: Colors.blue,
                  showFieldAsBox: true,
                  borderRadius: BorderRadius.circular(30),
                  fieldWidth: 50,
                  cursorColor: Colors.blue,
                  onSubmit: (String code) {
                    print("OTP is => $code");
                  },
                ),
              ),
              SizedBox(
                height: height * 0.035,
              ),
              Center(
                child: Custombutton(
                  title: "Confirm",
                  onPressed: () {},
                ),
              ),
              SizedBox(
                height: height * 0.035,
              ),
              Center(
                child: Text(
                  '$seconds',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: height * 0.035,
              ),
              CustomText(
                  firstString: "Not Received? ",
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.signupRoute);
                  },
                  secondString: "Send Again")
            ],
          ),
        ),
      ),
    );
  }
}
