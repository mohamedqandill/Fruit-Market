import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_app_bar.dart';

import '../../../../../core/routes_manager/routes.dart';
import '../../../../../core/widgets/custom_container.dart';
import '../../../../../core/widgets/custom_container_content.dart';

class MyOrderScreen extends StatelessWidget {
  const MyOrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: const CustomAppBar(
          actions: [],
          title: 'My Orders',
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: height * 0.01,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CustomContainer(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.orderTrackRoute);
                        },
                        widget: CustomContainerContent(
                            title: "#882610 ",
                            secondInRow: Row(
                              children: [
                                Text(
                                  "9 Sep",
                                  style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: width * 0.04,
                                      fontFamily: "Web"),
                                ),
                                SizedBox(width: width * 0.02),
                                Container(
                                  width: 5,
                                  height: 5,
                                  decoration: const BoxDecoration(
                                    color: Colors.grey,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: width * 0.01),
                                Text("4 Items",
                                    style: TextStyle(
                                        color: Colors.black45,
                                        fontSize: width * 0.04,
                                        fontFamily: "Web"))
                              ],
                            ),
                            thirdInRow: Flexible(
                              child: Row(
                                children: [
                                  Text("Status:  ",
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: width * 0.035,
                                          fontFamily: "Web")),
                                  Text("Finished",
                                      style: TextStyle(
                                          color: colors[index],
                                          fontSize: width * 0.035,
                                          fontFamily: "Web"))
                                ],
                              ),
                            ),
                            rightItem: Padding(
                              padding: EdgeInsets.only(right: width * 0.04),
                              child: Container(
                                width: width * 0.158,
                                height: isLandScape
                                    ? height * 0.24
                                    : height * 0.074,
                                decoration: BoxDecoration(
                                    color: colors[index],
                                    borderRadius:
                                        BorderRadius.circular(width * 0.5)),
                                child: Image.asset("assets/images/More2.png"),
                              ),
                            )),
                        image: images[index],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: height * 0.01,
                      );
                    },
                    itemCount: images.length),
              )
            ],
          ),
        ));
  }
}

List<String> images = [
  "assets/images/Frame 2870.png",
  "assets/images/Frame 2869.png",
  "assets/images/Frame 2868.png",
  "assets/images/Frame 2871.png",
  "assets/images/Frame 2873.png",
  "assets/images/Frame 2875.png",
];
List<Color> colors = [
  Color(0xffFEC500),
  Color(0xff00BB1A),
  Color(0xffFF4A4A),
  Color(0xff264493),
  Color(0xffCD28E8),
  Color(0xff28B0E8),
];
