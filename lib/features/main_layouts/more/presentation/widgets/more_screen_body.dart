import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/constants/constants.dart';
import 'package:responsive_adaptive_ui/core/widgets/customButton.dart';

class MoreScreenBody extends StatelessWidget {
  const MoreScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.all(width * 0.025),
      child: Column(
        children: [
          Center(
            child: Container(
              width: width * 0.25,
              height: height * 0.12,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.5),
                  border: Border.all(width: 2, color: Color(0xff959CA8))),
              child: FittedBox(
                child: Image.asset(
                  images[0],
                  height: height * 0.034,
                  width: width * 0.03,
                  color: Color(0xff858D9A),
                ),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          Text(
            "Welcome, Fruit Market",
            style: TextStyle(
                fontFamily: "Arial",
                fontSize: width * 0.06,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: height * 0.025,
          ),
          Custombutton(
            title: "Login",
            onPressed: () {},
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Expanded(
            child: ListView.separated(
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.028),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              images[index],
                              height: height * 0.034,
                              color: primaryColor,
                            ),
                            SizedBox(
                              width: width * 0.035,
                            ),
                            Text(
                              titles[index],
                              style: TextStyle(
                                  fontFamily: "Arial",
                                  fontSize: width * 0.041,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: width * 0.06,
                          color: Color(0xff858D9A),
                        )
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: height * 0.035,
                  );
                },
                itemCount: images.length),
          )
        ],
      ),
    );
  }
}

List<String> images = [
  "assets/images/Icon feather-user.png",
  "assets/images/orders.png",
  "assets/images/fav.png",
  "assets/images/24 Language.png",
  "assets/images/Icon awesome-headphones-alt.png",
  "assets/images/Group 19.png",
  "assets/images/Icon ionic-ios-information-circle-outline.png",
];
List<String> titles = [
  "Profile",
  "My Orders",
  "Favourite",
  "Language",
  "Support",
  "Terms & Conditions",
  "About Us"
];
