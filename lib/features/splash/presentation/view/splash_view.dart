import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/features/splash/presentation/widgets/splash_desktop_view.dart';
import 'package:responsive_adaptive_ui/features/splash/presentation/widgets/splash_tablet_view.dart';
import 'package:responsive_adaptive_ui/features/splash/presentation/widgets/splash_view_body.dart';

import '../../../../core/cache/cache_helper.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/layout_builder/layout_builder.dart';
import '../../../../core/routes_manager/routes.dart';
import '../widgets/splash_landscape_view.dart';

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
    return Scaffold(
        backgroundColor: primaryColor,
        body: AdaptiveLayout(
          landScapeLayout: (context) => const SplashLandScapeView(),
          mobileLayout: (context) => const SplashViewBody(),
          tabletLayout: (context) => const SplashTabletView(),
          desktopLayout: (context) => const SplashDesktopView(),
        ));
  }
}

void executeNavigation(BuildContext context) async {
  bool? isSecondTime = await CacheHelper.getData<bool>("isSecondTime");

  Future.delayed(
    Duration(seconds: 2),
    () {
      Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
      // if (isSecondTime == true && isSecondTime != null) {
      //   return Navigator.pushReplacementNamed(context, Routes.authRoute);
      // } else if (isSecondTime == null) {
      //   Navigator.pushReplacementNamed(context, Routes.onBoardingRoute);
      // }
    },
  );
}
