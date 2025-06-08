import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/constants/constants.dart';

import 'custom_back_arrow.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, required this.actions});

  final String title;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return AppBar(
        backgroundColor: Colors.white,
        bottom: const PreferredSize(
            preferredSize: Size(double.infinity, 0), child: Divider()),
        leading: const CustomBackArrow(),
        centerTitle: true,
        title: Text(
          title,
          style: TextStyle(
              fontFamily: "Poppins",
              fontSize: width * 0.06,
              color: primaryColor),
        ),
        actions: actions);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(65);
}
