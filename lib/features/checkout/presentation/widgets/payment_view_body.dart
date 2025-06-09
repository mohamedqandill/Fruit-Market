import 'dart:core';

import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_inline_text.dart';

import '../../../../core/constants/constants.dart';
import '../../../main_layouts/basket/presentation/widgets/custom_basket_text.dart';

class PaymentViewBody extends StatefulWidget {
  const PaymentViewBody({super.key});

  @override
  State<PaymentViewBody> createState() => _PaymentViewBodyState();
}

class _PaymentViewBodyState extends State<PaymentViewBody> {
  var selectedPayment;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return LayoutBuilder(
      builder: (context, constraints) {
        return SizedBox(
          height: constraints.maxWidth < 380
              ? height * 0.58
              : constraints.maxWidth > 600
                  ? height * 0.68
                  : height * 0.57,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Coupon Code",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: width * 0.048,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Sogeo UI")),
              SizedBox(
                height: height * 0.02,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                width: width * 0.9,
                height: height * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(width * 0.04),
                    border: Border.all(width: 1, color: Colors.black26)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Text(
                        "Do You Have any Coupon Code?",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: width * 0.045,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Web"),
                      ),
                    ),
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor.withOpacity(0.77),
                              fixedSize: Size(width * 0.05, height * 0.04)),
                          onPressed: () {},
                          child: FittedBox(
                            child: Text(
                              "Apply",
                              style: TextStyle(
                                  color: Colors.white, fontSize: width * 0.04),
                            ),
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.018,
              ),
              Text("Order Details",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: width * 0.048,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Sogeo UI")),
              SizedBox(
                height: height * 0.011,
              ),
              CustomInlineText(
                  isLight: true,
                  leftTitle: "Total Items",
                  rightTitle: Text(
                    "4 Items in cart",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Web",
                        fontSize: width * 0.04),
                  )),
              SizedBox(
                height: height * 0.008,
              ),
              CustomInlineText(
                  isLight: true,
                  leftTitle: "Subtotal",
                  rightTitle: Text(
                    "36.00 KD",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Web",
                        fontSize: width * 0.04),
                  )),
              SizedBox(
                height: height * 0.008,
              ),
              const CustomBasketText(
                title: "Shipping Charges",
                price: "1.50 ",
                currency: "KD",
              ),
              const Divider(),
              const CustomBasketText(
                title: "Bag Total",
                price: "37.50 ",
                currency: "KD",
                isBold: true,
              ),
              SizedBox(
                height: height * 0.008,
              ),
              Text("Payment",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: width * 0.048,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Sogeo UI")),
              SizedBox(
                height: height * 0.008,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: width * 0.025),
                        width: width * 0.9,
                        height: height * 0.052,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(width * 0.04),
                            border:
                                Border.all(width: 1, color: Colors.black26)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              Image.asset(images[index]),
                              SizedBox(
                                width: width * 0.01,
                              ),
                              Text(string[index],
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontSize: width * 0.045,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Web"))
                            ]),
                            Radio(
                              value: index,
                              groupValue: selectedPayment,
                              onChanged: (value) {
                                setState(() {
                                  selectedPayment = value;
                                });
                              },
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: height * 0.009,
                      );
                    },
                    itemCount: images.length),
              )
            ],
          ),
        );
      },
    );
  }
}

List<String> images = [
  "assets/images/Group 2830.png",
  "assets/images/Group 2831.png",
  "assets/images/knet.png"
];
List<String> string = [
  "Credit Card/Debit card",
  "Cash of Delivery",
  "Knet",
];
