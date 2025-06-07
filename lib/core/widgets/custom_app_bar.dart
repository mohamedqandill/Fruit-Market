import 'package:flutter/material.dart';

import 'custom_back_arrow.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return AppBar(
      bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 0), child: Divider()),
      leading: const CustomBackArrow(),
      centerTitle: true,
      title: Image.asset(
        "assets/images/Fruit Market.png",
        width: width * 0.4,
      ),
      actions: [
        Image.asset(
          "assets/images/search.png",
          color: Colors.black,
        ),
        SizedBox(
          width: width * 0.02,
        ),
      ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(60);
}
