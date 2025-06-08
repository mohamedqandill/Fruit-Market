import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/constants/constants.dart';
import 'package:responsive_adaptive_ui/core/routes_manager/routes.dart';
import 'package:responsive_adaptive_ui/core/widgets/customButton.dart';

class MoreScreenBody extends StatefulWidget {
  const MoreScreenBody({super.key});

  @override
  State<MoreScreenBody> createState() => _MoreScreenBodyState();
}

class _MoreScreenBodyState extends State<MoreScreenBody> {
  var selectedLanguage;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.all(width * 0.025),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            children: [
              Center(
                child: Container(
                  width: width * 0.25,
                  height: height * 0.12,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(width * 0.5),
                      border:
                          Border.all(width: 2, color: const Color(0xff959CA8))),
                  child: FittedBox(
                    child: Image.asset(
                      images[0],
                      height: height * 0.034,
                      width: width * 0.03,
                      color: const Color(0xff858D9A),
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
                      return InkWell(
                        onTap: () {
                          if (index == 0) {
                            Navigator.pushNamed(context, Routes.profileRoute);
                          } else if (index == 1) {
                            Navigator.pushNamed(context, Routes.myOrderRoute);
                          } else if (index == 2) {
                            Navigator.pushNamed(
                                context, Routes.myFavoriteRoute);
                          } else if (index == 3) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(width * 0.05),
                                  ),
                                  child: StatefulBuilder(
                                    builder: (context, setState) {
                                      return Container(
                                        padding: EdgeInsets.all(width * 0.04),
                                        height: height * 0.35,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Row(
                                              children: [
                                                Transform.scale(
                                                  scale: 1.5,
                                                  child: Radio(
                                                    value: 1,
                                                    groupValue:
                                                        selectedLanguage,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedLanguage =
                                                            value!;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Image.asset(
                                                  'assets/images/Clip path group.png',
                                                  fit: BoxFit.cover,
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                Text(
                                                  'العربيه',
                                                  style: TextStyle(
                                                      fontSize: width * 0.05),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: constraints.maxWidth < 380
                                                  ? height * 0.005
                                                  : height * 0.02,
                                            ),
                                            Row(
                                              children: [
                                                Transform.scale(
                                                  scale: 1.5,
                                                  child: Radio(
                                                    value: 2,
                                                    groupValue:
                                                        selectedLanguage,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        selectedLanguage =
                                                            value!;
                                                      });
                                                    },
                                                  ),
                                                ),
                                                Image.asset(
                                                  'assets/images/Group 2851.png',
                                                  fit: BoxFit.cover,
                                                ),
                                                SizedBox(
                                                  width: width * 0.02,
                                                ),
                                                Text(
                                                  'English',
                                                  style: TextStyle(
                                                      fontSize: width * 0.05),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: width * 0.03),
                                              child: Custombutton(
                                                title: "Apply",
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                isSmall: true,
                                              ),
                                            ),
                                            TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text(
                                                  "Close",
                                                  style: TextStyle(
                                                      color: Colors.grey,
                                                      fontFamily: "Web",
                                                      fontSize: width * 0.04),
                                                ))
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                );
                              },
                            );
                          } else if (index == 5) {
                            Navigator.pushNamed(context, Routes.termsRoute);
                          } else if (index == 4) {
                            Navigator.pushNamed(context, Routes.contactRoute);
                          }
                        },
                        child: Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.028),
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
          );
        },
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
