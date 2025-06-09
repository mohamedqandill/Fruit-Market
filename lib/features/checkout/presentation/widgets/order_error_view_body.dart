import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/widgets/customButton.dart';

class OrderErrorViewBody extends StatelessWidget {
  const OrderErrorViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Image.asset("assets/images/Group 150.png")),
          Text(
            "OPS",
            style: TextStyle(
                fontFamily: "Web",
                fontSize: width * 0.058,
                fontWeight: FontWeight.bold,
                color: Colors.red),
          ),
          SizedBox(
            height: height * 0.028 * 2,
          ),
          Text(
            "Error while confirming your payment/order",
            style: TextStyle(
                fontFamily: "Web",
                fontSize: width * 0.049,
                color: Colors.black54),
          ),
          SizedBox(
            height: height * 0.028 * 2,
          ),
          Custombutton(
            isPrimary: false,
            backgroungColor: Colors.red,
            title: "Back",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
