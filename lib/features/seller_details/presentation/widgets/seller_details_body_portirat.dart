import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_container.dart';

import '../../../../../core/widgets/custom_container_content.dart';
import '../../../../../core/widgets/custom_fruit_container.dart';
import '../../../../../core/widgets/custom_inline_text.dart';
import '../../../../core/routes_manager/routes.dart';

class SellerDetailsBodyPortirat extends StatelessWidget {
  const SellerDetailsBodyPortirat({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: EdgeInsets.all(width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomContainer(
            widget: CustomContainerContent(
              title: "Seller name",
              secondInRow: Text(
                " Delivery : 40 to 60 Min",
                style: TextStyle(fontSize: width * 0.035),
              ),
              thirdInRow: Row(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Text(
                        "Open",
                        style: TextStyle(
                            fontSize: width * 0.035, color: Colors.green),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.05,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                          shape: BoxShape.circle,
                        ),
                      ),
                      SizedBox(width: width * 0.02),
                      Text(
                        "4.5",
                        style: TextStyle(
                            fontSize: width * 0.035, color: Colors.grey),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.19,
                  ),
                ],
              ),
              rightItem: Padding(
                padding:
                    EdgeInsets.only(bottom: width * 0.15, right: width * 0.02),
                child: Image.asset(
                  "assets/images/Path 144.png",
                  // width: width * 0.09,
                ),
              ),
            ),
            onPressed: () {},
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Text(
            "Categories",
            style: TextStyle(fontFamily: "Web", fontSize: width * 0.051),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          SizedBox(
            height: height * 0.164,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      FittedBox(
                        child: CustomFruitContainer(
                          image: images[index],
                          width: width * 0.195,
                          height: height * 0.096,
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Text(
                        titles[index],
                        style: TextStyle(
                            fontFamily: "Inter", fontSize: width * 0.05),
                      )
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    width: width * 0.03,
                  );
                },
                itemCount: images.length),
          ),
          CustomInlineText(
            leftTitle: "Products",
            rightTitle: Image.asset("assets/images/Forma 1.png"),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) => CustomContainer(
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
                        rightItem: Padding(
                          padding: EdgeInsets.only(right: width * 0.05),
                          child: Image.asset(
                            fit: BoxFit.fill,
                            "assets/images/cont3.png",
                            height: height * 0.06,
                            width: width * 0.15,
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Routes.productDetailsRoute);
                      },
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: height * 0.02,
                    ),
                itemCount: 2),
          )
        ],
      ),
    );
  }
}

List<String> images = [
  "assets/images/fruit.png",
  "assets/images/veg.png",
  "assets/images/Iphone 1.png",
  "assets/images/pet.png",
];
List<String> titles = [
  "Fruits",
  "Vegetables",
  "Phone",
  "Pets",
];
