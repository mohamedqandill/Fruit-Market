import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/layout_builder/layout_builder.dart';

import '../widgets/custom_on_boarding_view.dart';

class OnBoardingView extends StatefulWidget {
  const OnBoardingView({super.key});

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AdaptiveLayout(
      mobileLayout: (context) => const CustomOnBoardingView(),
      tabletLayout: (context) => const CustomOnBoardingView(
        buttonWidth: 0.3,
        dividerIndent: 0.91,
      ),
      desktopLayout: (context) => const CustomOnBoardingView(
        buttonWidth: 0.2,
        dividerIndent: 0.95,
      ),
    ));
  }
}
