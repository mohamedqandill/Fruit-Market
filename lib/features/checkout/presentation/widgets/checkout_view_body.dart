import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/constants/constants.dart';
import 'package:responsive_adaptive_ui/core/routes_manager/routes.dart';
import 'package:responsive_adaptive_ui/features/checkout/presentation/widgets/delivery_time_view_body.dart';
import 'package:responsive_adaptive_ui/features/checkout/presentation/widgets/payment_view_body.dart';

import '../../../../core/widgets/customButton.dart';
import 'delivery_address_view_body.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  int activeSteps = 1;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.03,
      ),
      child: Column(
        children: [
          EasyStepper(
            direction: Axis.horizontal,
            activeStep: activeSteps,
            activeStepTextColor: primaryColor,
            finishedStepTextColor: primaryColor,
            finishedStepBackgroundColor: primaryColor,
            internalPadding: width * 0.05,
            showLoadingAnimation: false,
            stepRadius: width * 0.035,
            showStepBorder: false,
            lineStyle: LineStyle(
              lineLength: width * 0.17,
              lineType: LineType.dashed,
              lineThickness: width * 0.005,
            ),
            steps: List.generate(3, (index) {
              return EasyStep(
                title: titles[index],
                customStep: CircleAvatar(
                  radius: width * 0.027,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: width * 0.012,
                    backgroundColor:
                        activeSteps >= index ? primaryColor : Colors.white,
                  ),
                ),
              );
            }),
            onStepReached: (index) => setState(() => activeSteps = index),
          ),
          const Divider(),
          SizedBox(
            height: height * 0.01,
          ),
          activeSteps == 0
              ? const DeliveryTimeViewBody()
              : activeSteps == 1
                  ? const DeliveryAddressViewBody()
                  : const PaymentViewBody(),
          const Spacer(),
          Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: height * 0.015),
              child: Custombutton(
                title: activeSteps < 2 ? "Continue" : "Place Order",
                onPressed: () {
                  if (activeSteps < 2) {
                    setState(() {
                      activeSteps++;
                    });
                  } else {
                    Navigator.pushNamed(context, Routes.orderConfRoute);
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<String> titles = [
  "Delivery Time",
  "Delivery Address",
  "Payment",
];
