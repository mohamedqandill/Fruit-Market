import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_app_bar.dart';

import '../../../../../core/widgets/customButton.dart';
import '../../../../auth/presentation/widgets/custom_field.dart';
import '../../../../auth/presentation/widgets/custom_phone_field.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "", actions: []),
      body: Column(
        children: [
          SizedBox(
            height: height * 0.02,
          ),
          Center(
            child: Container(
              width: width * 0.25,
              height: height * 0.12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.5),
                  border: Border.all(width: 2, color: const Color(0xff959CA8))),
              child: FittedBox(
                child: Image.asset(
                  "assets/images/Icon feather-user.png",
                  height: height * 0.034,
                  width: width * 0.03,
                  color: const Color(0xff858D9A),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          Text(
            "Welcome, Mohamed",
            style: TextStyle(
                fontFamily: "Arial",
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold),
          ),
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
              title: "Update",
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
