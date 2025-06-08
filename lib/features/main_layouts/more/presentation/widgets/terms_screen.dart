import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_app_bar.dart';

class TermsScreen extends StatelessWidget {
  const TermsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Terms and Conditions", actions: []),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.015),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                """A Terms and Conditions agreement acts asa legal contractbetween you (the company)and the user.It’s where you maintain your rights to exclude users from your app in the event that they abuse your
 website/app, set out the rules for
 using your service and note other important
 details and disclaimers.
 Having a Terms and Conditions agreement is
 completely optional. No laws require you to
have one. Not even the super-strict and
wide-reaching General Data Protection
Regulation (GDPR).
Your Terms and Conditions agreement will
be uniquely yours. While some clauses are
standard and commonly seen in pretty much
every Terms and Conditions agreement, it’s
up to you to set the rules and guidelines that the user must agree to. Terms and Conditions agreements are also known as Terms of Service or Terms of Use
agreements. These terms are
interchangeable, practically speaking.
More rarely, it may be called something like
an End User Services Agreement (EUSA).""",
                style: TextStyle(
                    fontFamily: "Arial",
                    fontSize: width * 0.042,
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
      ),
    );
  }
}
