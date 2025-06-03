import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/constants/constants.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widgets/customButton.dart';
import '../widgets/on_boarding_view_body.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
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
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.all(height * 0.03),
              child: InkWell(
                onTap: () async {
                  await CacheHelper.saveData<bool>("isSecondTime", true);
                  Navigator.pushReplacementNamed(context, Routes.authRoute);
                },
                child: Visibility(
                  visible: currentPage == 0 || currentPage == 1 ? true : false,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Skip"),
                      Divider(
                        indent: width * 0.8,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
                child: OnBoardingViewBody(
              pageController: pageController,
            )),
            SizedBox(
              height: height * 0.025,
            ),
            DotsIndicator(
              dotsCount: 3,
              position: currentPage == 0
                  ? 0.0
                  : currentPage == 1
                      ? 1.0
                      : 2.0,
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
            SizedBox(
              height: height * 0.1,
            ),
            Custombutton(
              title:
                  currentPage == 0 || currentPage == 1 ? "Next" : "Get Started",
              width: width * 0.5,
              height: height * 0.07,
              onPressed: () async {
                if (currentPage < 2) {
                  pageController.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.ease,
                  );
                } else {
                  await CacheHelper.saveData<bool>("isSecondTime", true);
                  Navigator.pushReplacementNamed(context, Routes.authRoute);
                }
              },
            ),
            SizedBox(
              height: height * 0.17,
            )
          ],
        ),
      ),
    );
  }
}
