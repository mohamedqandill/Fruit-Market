import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/routes_manager/routes.dart';
import '../../../../core/widgets/customButton.dart';
import 'on_boarding_view_body.dart';

class CustomOnBoardingView extends StatefulWidget {
  const CustomOnBoardingView(
      {this.dividerIndent = 0.8,
      this.buttonHeight = 0.07,
      this.firstBoxHeight = 0.025,
      this.secondBoxHeight = 0.05,
      this.buttonWidth = 0.5,
      super.key});

  final num dividerIndent;
  final num firstBoxHeight;
  final num secondBoxHeight;
  final num buttonWidth;
  final num buttonHeight;

  @override
  State<CustomOnBoardingView> createState() => _CustomOnBoardingViewState();
}

class _CustomOnBoardingViewState extends State<CustomOnBoardingView> {
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
    return SafeArea(
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
                      indent: width * widget.dividerIndent,
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
            height: height * widget.firstBoxHeight,
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
            height: height * widget.secondBoxHeight,
          ),
          Custombutton(
            title:
                currentPage == 0 || currentPage == 1 ? "Next" : "Get Started",
            onPressed: () async {
              if (currentPage < 2) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
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
    );
  }
}
