import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/constants/constants.dart';
import 'package:responsive_adaptive_ui/core/routes_manager/routes.dart';
import 'package:responsive_adaptive_ui/core/widgets/customButton.dart';

class OrderConfirmationViewBody extends StatelessWidget {
  const OrderConfirmationViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Image.asset("assets/images/Group 2828.png")),
            Text(
              "YOUR ORDER IS CONFIRMED!",
              style: TextStyle(
                  fontFamily: "Web",
                  fontSize: width * 0.058,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            Text(
              "Your order code: #243188",
              style: TextStyle(
                  fontFamily: "Web",
                  fontSize: width * 0.049,
                  color: Colors.black54),
            ),
            Text(
              "Thank you for choosing our products!",
              style: TextStyle(
                  fontFamily: "Web",
                  fontSize: width * 0.049,
                  color: Colors.black54),
            ),
            SizedBox(
              height: height * 0.028,
            ),
            Custombutton(
              title: "Continue Shopping",
              onPressed: () {
                Navigator.pushReplacementNamed(context, Routes.mainLayoutRoute);
              },
            ),
            SizedBox(
              height: height * 0.028,
            ),
            Custombutton(
              isPrimary: false,
              color: primaryColor,
              backgroungColor: Colors.white,
              title: "Track Order",
              onPressed: () {
                Navigator.pushNamed(context, Routes.orderTrackRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}
