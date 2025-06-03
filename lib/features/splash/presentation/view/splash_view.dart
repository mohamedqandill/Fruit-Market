import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/constants/constants.dart';
import 'package:responsive_adaptive_ui/core/routes_manager/routes.dart';

import '../../../../core/cache/cache_helper.dart';
import '../widgets/splash_view_body.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    executeNavigation(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: primaryColor,
      body: SplashViewBody(),
    );
  }
}

void executeNavigation(BuildContext context) async {
  bool? isSecondTime = await CacheHelper.getData<bool>("isSecondTime");

  Future.delayed(
    Duration(seconds: 2),
    () {
      // Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
      if (isSecondTime == true && isSecondTime != null) {
        return Navigator.pushReplacementNamed(context, Routes.authRoute);
      } else if (isSecondTime == null) {
        Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
      }
    },
  );
}
