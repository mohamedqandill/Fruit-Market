import 'package:flutter/material.dart';

class AdaptiveLayout extends StatelessWidget {
  const AdaptiveLayout(
      {required this.desktopLayout,
      required this.landScapeLayout,
      required this.tabletLayout,
      required this.mobileLayout,
      super.key});
  final WidgetBuilder mobileLayout,
      tabletLayout,
      desktopLayout,
      landScapeLayout;
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = MediaQuery.of(context).size;
        final isLandscape =
            MediaQuery.of(context).orientation == Orientation.landscape;
        final shortestSide = size.shortestSide;

        if (shortestSide < 600) {
          // ده موبايل حقيقي
          if (isLandscape) {
            return landScapeLayout(context); // ✅ موبايل landscape
          } else {
            return mobileLayout(context); // ✅ موبايل portrait
          }
        } else if (constraints.maxWidth >= 600 && constraints.maxWidth < 900) {
          return tabletLayout(context); // ✅ تابلت
        } else {
          return desktopLayout(context); // ✅ ديسكتوب
        }
      },
    );
  }
}
