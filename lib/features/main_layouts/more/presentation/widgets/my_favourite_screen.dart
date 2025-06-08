import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_app_bar.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_container_title.dart';

import '../../../../../core/widgets/custom_container.dart';
import '../../../../../core/widgets/custom_container_content.dart';

class MyFavouriteScreen extends StatelessWidget {
  const MyFavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Scaffold(
      appBar: const CustomAppBar(title: "My Favourite", actions: []),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: width * 0.03, vertical: height * 0.015),
        child: Column(
          children: [
            Expanded(
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
                            thirdInRow: const CustomContainerTitle(
                                title: "Store Name : Store 1"),
                            rightItem: Padding(
                              padding: EdgeInsets.only(
                                  right: width * 0.04, bottom: height * 0.07),
                              child: Image.asset(
                                "assets/images/Icon material-delete-forever.png",
                                width: width * 0.05,
                                height: height * 0.03,
                                fit: BoxFit.fill,
                              ),
                            )),
                        onPressed: () {});
                  },
                  separatorBuilder: (context, index) => SizedBox(
                        height: height * 0.02,
                      ),
                  itemCount: 3),
            ),
          ],
        ),
      ),
    );
  }
}
