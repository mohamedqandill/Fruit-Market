import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/features/onBoarding/presentation/widgets/page_view_item.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({required this.pageController, super.key});

  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      children: const [
        PageViewItem(
          title: "E Shopping",
          subTitle: "Explore op organic fruits & grab them",
        ),
        PageViewItem(
          title: "Delivery Arrived",
          subTitle: "Order is arrived at your Place",
        ),
        PageViewItem(
          title: "Delivery Arrived",
          subTitle: "Order is arrived at your Place",
        ),
      ],
    );
  }
}
