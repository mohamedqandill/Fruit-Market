import 'package:flutter/material.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({required this.height, super.key});

  final double height;
  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(height);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return AppBar(
      backgroundColor: Colors.white,
      bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 0), child: Divider()),
      leadingWidth: 0,
      leading: const SizedBox(),
      title: Image.asset(
        "assets/images/Fruit Market.png",
        width: width * 0.4,
      ),
      actions: [
        Image.asset(
          "assets/images/search.png",
        ),
        SizedBox(
          width: width * 0.04,
        ),
        Image.asset(
          "assets/images/filter.png",
        ),
        SizedBox(
          width: width * 0.02,
        ),
      ],
    );
  }
}
