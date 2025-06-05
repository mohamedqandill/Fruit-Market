import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/custom_container.dart';
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

    return Column(
      children: [
        SizedBox(
          height: height * 0.145,
          child: PageView(
            controller: pageController,
            children: [
              Image.asset("assets/images/homeFrame.png"),
              Image.asset("assets/images/homeFrame.png"),
              Image.asset("assets/images/homeFrame.png"),
              Image.asset("assets/images/homeFrame.png"),
            ],
          ),
        ),
        Padding(
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
        Padding(
          padding: EdgeInsets.only(left: width * 0.05, bottom: 5),
          child: SizedBox(
            height: height * 0.09,
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
                    width: width * 0.03,
                  );
                },
                itemCount: 4),
          ),
        ),
        Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.03),
            child: const CustomInlineText(
              leftTitle: "Sellers",
              rightTitle: Text("Show all",
                  style: TextStyle(
                      color: Color(0xff235C95),
                      fontSize: 18,
                      fontFamily: "Arial")),
            )),
        Expanded(
          child: ListView.builder(
            itemCount: 3,
            itemBuilder: (context, index) {
              return CustomContainer(
                widget: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Row(
                          children: [
                            const Text(
                              "Seller Name",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Sogeo UI"),
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Image.asset("assets/images/home8.png"),
                            SizedBox(
                              width: width * 0.23,
                            ),
                            const Text("4.5")
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Image.asset("assets/images/delivIcon.png"),
                            Text(" Delivery Charges : 0.5 KD")
                          ],
                        ),
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
                              const SizedBox(width: 8),
                              const Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Open",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.green),
                                ),
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
                              const SizedBox(width: 8),
                              const Padding(
                                padding: EdgeInsets.only(top: 5),
                                child: Text(
                                  "Pizza",
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.blueAccent),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: width * 0.23,
                          ),
                          Row(
                            children: [
                              Text("2.5KM"),
                              Image.asset("assets/images/Path 218.png")
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}

List<String> images = [
  "assets/images/home1.png",
  "assets/images/home2.png",
  "assets/images/home3.png",
  "assets/images/home4.png",
];
