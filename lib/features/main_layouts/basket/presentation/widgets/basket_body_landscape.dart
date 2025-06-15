import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/routes_manager/routes.dart';
import '../../../../../core/widgets/custom_container.dart';
import '../../../../../core/widgets/custom_container_content.dart';
import 'custom_basket_text.dart';

class BasketBodyViewLandScape extends StatelessWidget {
  const BasketBodyViewLandScape({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.01, vertical: width * 0.01),
      child: SingleChildScrollView(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: width * 0.58,
              height: height * 0.6,
              child: ListView.separated(
                  scrollDirection: Axis.vertical,
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
                                        fontSize: width * 0.025)),
                                SizedBox(
                                  width: width * 0.025,
                                ),
                                Text(
                                  "14.00 KD",
                                  style: TextStyle(
                                      color: Colors.black26,
                                      decoration: TextDecoration.lineThrough,
                                      fontSize: width * 0.025),
                                ),
                              ],
                            ),
                            thirdInRow: Container(
                              width: width * 0.17,
                              height: height * 0.1,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(width * 0.2),
                                color: const Color(0xffDF958F),
                              ),
                              child: Center(
                                  child: FittedBox(
                                child: Text(
                                  "Up to 10% Off",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.025),
                                ),
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
                                      right: width * 0.02,
                                      bottom: width * 0.01),
                                  child: Container(
                                    width: width * 0.14,
                                    height: height * 0.1,
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
                                          size: width * 0.018,
                                        ),
                                        Text(
                                          "1",
                                          style: TextStyle(
                                            fontFamily: "Web",
                                            fontSize: width * 0.018,
                                          ),
                                        ),
                                        Icon(
                                          Icons.add,
                                          size: width * 0.018,
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            )),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, Routes.productDetailsRoute);
                        });
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: height * 0.02,
                      ),
                  itemCount: 4),
            ),
            const Spacer(),
            SizedBox(
              width: width * 0.37,
              height: height * 0.57,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                  // const Spacer(),
                  Padding(
                    padding: EdgeInsets.only(bottom: height * 0.01),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("4 Items in cart",
                                style: TextStyle(
                                    color: Colors.black45,
                                    fontSize: width * 0.027,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Web")),
                            Text("37.50 KD",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: width * 0.027,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Web"))
                          ],
                        ),
                        // const Spacer(),
                        Expanded(
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      primaryColor.withOpacity(0.77),
                                  fixedSize: Size(width * 0.16, height * 0.04)),
                              onPressed: () {
                                Navigator.pushNamed(
                                    context, Routes.checkoutRoute);
                              },
                              child: FittedBox(
                                child: Text(
                                  "Proceed To Checkout",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.016),
                                ),
                              )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
