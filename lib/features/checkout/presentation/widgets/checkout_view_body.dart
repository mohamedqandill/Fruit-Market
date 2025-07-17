import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/constants/constants.dart';
import 'package:responsive_adaptive_ui/core/routes_manager/routes.dart';
import 'package:responsive_adaptive_ui/features/checkout/data/model/make_order_model.dart';
import 'package:responsive_adaptive_ui/features/checkout/presentation/widgets/checkout_view_body_landscape.dart';
import 'package:responsive_adaptive_ui/features/checkout/presentation/widgets/delivery_time_view_body.dart';
import 'package:responsive_adaptive_ui/features/checkout/presentation/widgets/payment_view_body.dart';

import '../../../../core/widgets/customButton.dart';
import '../../../main_layouts/basket/presentation/widgets/basket_body_portrait.dart';
import 'delivery_address_view_body.dart';

class CheckoutViewBody extends StatefulWidget {
  const CheckoutViewBody({super.key});

  @override
  State<CheckoutViewBody> createState() => _CheckoutViewBodyState();
}

class _CheckoutViewBodyState extends State<CheckoutViewBody> {
  int activeSteps = 0;
  String selectedDate = "";
  String selectedAddress = "";

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var data = ModalRoute.of(context)?.settings.arguments as OrderedProducts;
    print(data);

    return isLandScape
        ? const CheckoutViewBodyLandScape()
        : Padding(
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
                  internalPadding: width * 0.09,
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
                          backgroundColor: activeSteps >= index
                              ? primaryColor
                              : Colors.white,
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
                    ? DeliveryTimeViewBody(
                        selectedDateTime: (date) {
                          selectedDate = date;
                          print(selectedDate);
                        },
                      )
                    : activeSteps == 1
                        ? DeliveryAddressViewBody(
                            selectAddress: (address) {
                              selectedAddress = address;
                              print(selectedAddress);
                            },
                          )
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
                          List<CheckoutOrders> checkoutOrders = [];
                          for (var i in data.products) {
                            checkoutOrders.add(CheckoutOrders(
                                prodId: i.id,
                                quantity: i.quantity,
                                price: i.price));
                          }
                          MakeOrderModel makeOrderModel = MakeOrderModel(
                              totalPrice: data.totalPrice,
                              checkoutOrders: checkoutOrders,
                              paymentType: "cash_on_delivery",
                              address: selectedAddress,
                              orderTime: selectedDate);
                          Navigator.pushNamed(context, Routes.orderTrackRoute,
                              arguments: makeOrderModel);
                        }
                      },
                    ),
                  ),
                ),
              ],
            ));
  }
}

List<String> titles = [
  "Delivery Time",
  "Delivery Address",
  "Payment",
];
