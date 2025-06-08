import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/routes_manager/routes.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/custom_container.dart';
import '../../../../../core/widgets/custom_container_title.dart';
import '../../../../../core/widgets/custom_fruit_container.dart';
import '../../../../../core/widgets/custom_inline_text.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late PageController pageController;
  var currentPage = 0;

  @override
  void initState() {
    pageController = PageController();
    pageController.addListener(
      () {
        currentPage = pageController.page!.round();
        setState(() {});
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.145,
                child: PageView(
                  controller: pageController,
                  children: [
                    Image.asset(
                      "assets/images/homeFrame.png",
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "assets/images/homeFrame.png",
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "assets/images/homeFrame.png",
                      fit: BoxFit.fill,
                    ),
                    Image.asset(
                      "assets/images/homeFrame.png",
                      fit: BoxFit.fill,
                    ),
                  ],
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DotsIndicator(
                    dotsCount: 4,
                    position: currentPage == 0
                        ? 0.0
                        : currentPage == 1
                            ? 1.0
                            : currentPage == 2
                                ? 2.0
                                : 3.0,
                    decorator: const DotsDecorator(
                      color: Colors.transparent,
                      shape: CircleBorder(
                          eccentricity: 1.0,
                          side: BorderSide(
                            color: Colors.grey,
                          )), // Inactive color
                      activeColor: primaryColor,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.093,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CustomFruitContainer(
                        width: width * 0.20,
                        height: height * 0.09,
                        image: images[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        width: width * 0.038,
                      );
                    },
                    itemCount: 4),
              ),
              const CustomInlineText(
                leftTitle: "Sellers",
                rightTitle: Text("Show all",
                    style: TextStyle(
                        color: Color(0xff235C95),
                        fontSize: 18,
                        fontFamily: "Arial")),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Expanded(
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(
                    height: height * 0.01,
                  ),
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return CustomContainer(
                      widget: Expanded(
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(top: height * 0.008),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const CustomContainerTitle(
                                    title: "Seller name",
                                  ),
                                  Row(
                                    children: [
                                      Image.asset(
                                          "assets/images/delivIcon.png"),
                                      Text(
                                        "  Delivery Charges : 0.5 KD",
                                        style: TextStyle(
                                            color: Colors.black38,
                                            fontFamily: "Web",
                                            fontSize: width * 0.035),
                                      ),
                                    ],
                                  ),
                                  Row(
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
                                                fontSize: width * 0.035,
                                                color: Colors.green),
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
                                            "Pizza",
                                            style: TextStyle(
                                                fontSize: width * 0.035,
                                                color: Colors.blueAccent),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width: width * 0.19,
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: width * 0.03),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: height * 0.02),
                                    child: Text("4.5",
                                        style: TextStyle(
                                            fontSize: width * 0.035,
                                            color: Colors.grey)),
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(bottom: height * 0.01),
                                    child: Row(
                                      children: [
                                        Text("2.5KM",
                                            style: TextStyle(
                                                fontSize: width * 0.035,
                                                color: Colors.grey)),
                                        Image.asset(
                                            "assets/images/Path 218.png")
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.sellerRoute);
                      },
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}

List<String> images = [
  "assets/images/home1.png",
  "assets/images/home2.png",
  "assets/images/home3.png",
  "assets/images/home4.png",
];
