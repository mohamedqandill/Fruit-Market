import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/routes_manager/routes.dart';
import 'package:responsive_adaptive_ui/core/widgets/customButton.dart';
import 'package:universal_stepper/universal_stepper.dart';

import 'cancel_order_dialog.dart';

class OrderTrackingViewBodyLandScape extends StatefulWidget {
  const OrderTrackingViewBodyLandScape({super.key});

  @override
  State<OrderTrackingViewBodyLandScape> createState() =>
      _OrderTrackingViewBodyLandScapeState();
}

class _OrderTrackingViewBodyLandScapeState
    extends State<OrderTrackingViewBodyLandScape> {
  var activeSteps = 1;
  var currentStep;
  var stepperData;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Your Order Code: ",
                      style: TextStyle(
                          fontFamily: "Web",
                          fontSize: width * 0.045,
                          color: Colors.black45),
                    ),
                    Text(" #882610",
                        style: TextStyle(
                            fontFamily: "Web",
                            fontSize: width * 0.045,
                            color: Colors.black)),
                  ],
                ),
                Text("3 items - 37.50 KD ",
                    style: TextStyle(
                        fontFamily: "Web",
                        fontSize: width * 0.045,
                        color: Colors.black45)),
                Text("Payment Method : Cash ",
                    style: TextStyle(
                        fontFamily: "Web",
                        fontSize: width * 0.045,
                        color: Colors.black45)),
                SizedBox(
                  height: height * 0.01,
                ),
                UniversalStepper(
                  inverted: false,
                  stepperDirection: Axis.vertical,
                  elementBuilder: (context, index) {
                    return Expanded(
                      child: Container(
                          padding: const EdgeInsets.only(left: 10, bottom: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Text(titles[index],
                                  style: TextStyle(
                                      fontFamily: "Web",
                                      fontSize: width * 0.045,
                                      color: Colors.black)),
                              Text(subTitles[index],
                                  style: TextStyle(
                                      fontFamily: "Web",
                                      fontSize: width * 0.045,
                                      color: Colors.black45)),
                            ],
                          ) // your element
                          ),
                    );
                  },
                  badgeBuilder: (context, index) {
                    return Container(
                      width: width * 0.08,
                      height: width * 0.08,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: index <= 2 ? 2 : 0,
                          color: Colors.green,
                        ),
                        color: index > 2 ? Colors.green : Colors.white,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(30)),
                      ),
                    );
                  },
                  pathBuilder: (context, index) {
                    return Container(
                      color: Colors.green,
                      width: width * 0.01,
                      height: constraints.maxWidth < 380 ||
                              constraints.maxWidth > 600
                          ? height * 0.05
                          : height * 0.069,
                    );
                  },
                  elementCount: 5,
                  badgePosition: StepperBadgePosition.end,
                ),
                Custombutton(
                  title: "Confirm",
                  onPressed: () {
                    Navigator.pushNamed(context, Routes.orderConfRoute);
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Custombutton(
                    isPrimary: false,
                    backgroungColor: Colors.red,
                    title: "Cancel Order",
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const CancelOrderDialog();
                        },
                      );
                    },
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

List<String> titles = [
  "Delivered",
  "Out for delivery",
  "Order shipped",
  "Confirmed",
  "Order Placed",
];
List<String> subTitles = [
  "Estimated for 10 September, 2021 ",
  "Estimated for 10 September, 2021 ",
  "Estimated for 10 September, 2021 ",
  "Your order has been confirmed ",
  "We have received your order",
];
