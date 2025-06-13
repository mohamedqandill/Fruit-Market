import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/presentation/widgets/home_screen_body_landscape.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/presentation/widgets/home_screen_body_portirat.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
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
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return isLandScape
        ? const HomeScreenBodyLandscape()
        : const HomeScreenBodyPortirat();
  }
}

List<String> images = [
  "assets/images/home1.png",
  "assets/images/home2.png",
  "assets/images/home3.png",
  "assets/images/home4.png",
];
