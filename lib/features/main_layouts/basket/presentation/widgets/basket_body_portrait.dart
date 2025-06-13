import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes_manager/routes.dart';
import '../../../../../core/widgets/custom_container.dart';
import '../../../../../core/widgets/custom_container_content.dart';
import 'custom_basket_text.dart';

class BasketBodyViewPortrait extends StatelessWidget {
  const BasketBodyViewPortrait({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: width * 0.01),
      child: Column(
        children: [
          SizedBox(
            height: height * 0.52,
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return CustomContainer(
                      image: "assets/images/Frame 2865.png",
                      widget: CustomContainerContent(
                          title: "Product name",
                          secondInRow: Row(
                            children: [
                              Text("12.00 KD",
                                  style: TextStyle(
                                      color: Colors.black26,
                                      fontSize: width * 0.035)),
                              SizedBox(
                                width: width * 0.025,
                              ),
                              Text(
                                "14.00 KD",
                                style: TextStyle(
                                    color: Colors.black26,
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: width * 0.035),
                              ),
                            ],
                          ),
                          thirdInRow: Container(
                            width: width * 0.27,
                            height: height * 0.027,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(width * 0.2),
                              color: const Color(0xffDF958F),
                            ),
                            child: Center(
                                child: Text(
                              "Up to 10% Off",
                              style: TextStyle(
                                  color: Colors.white, fontSize: width * 0.035),
                            )),
                          ),
                          rightItem: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                    right: width * 0.04, top: width * 0.02),
                                child: Image.asset(
                                  "assets/images/Icon material-delete-forever.png",
                                  width: width * 0.048,
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: EdgeInsets.only(
                                    right: width * 0.02, bottom: width * 0.01),
                                child: Container(
                                  width: width * 0.3,
                                  height: height * 0.03,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius:
                                          BorderRadius.circular(width * 0.5)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.remove,
                                        size: width * 0.048,
                                      ),
                                      Text(
                                        "1",
                                        style: TextStyle(
                                          fontFamily: "Web",
                                          fontSize: width * 0.038,
                                        ),
                                      ),
                                      Icon(
                                        Icons.add,
                                        size: width * 0.048,
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                      onPressed: () {});
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: height * 0.02,
                    ),
                itemCount: 3),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: List.generate(
                    50,
                    (index) {
                      return Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(right: width * 0.0035),
                          child: Container(
                            width: width * 0.001,
                            height: height * 0.002,
                            color: Colors.black26,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                const CustomBasketText(
                  title: "Subtotal",
                  price: "36.00 ",
                  currency: "KD",
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                const CustomBasketText(
                  title: "Shipping Charges",
                  price: "1.50 ",
                  currency: "KD",
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                const CustomBasketText(
                  title: "Bag Total",
                  price: "37.50 ",
                  currency: "KD",
                  isBold: true,
                ),
                const Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: height * 0.01),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("4 Items in cart",
                              style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: width * 0.037,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Web")),
                          Text("37.50 KD",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: width * 0.037,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Web"))
                        ],
                      ),
                      const Spacer(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor.withOpacity(0.77),
                              fixedSize: Size(width * 0.53, height * 0.03)),
                          onPressed: () {
                            Navigator.pushNamed(context, Routes.checkoutRoute);
                          },
                          child: FittedBox(
                            child: Text(
                              "Proceed To Checkout",
                              style: TextStyle(
                                  color: Colors.white, fontSize: width * 0.038),
                            ),
                          ))
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
