import 'package:flutter/material.dart';

import 'filter_dialog.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar({
    required this.height,
    super.key,
    required this.onTap,
  });

  final double height;
  final VoidCallback onTap;

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
      scrolledUnderElevation: 0,
      bottom: const PreferredSize(
          preferredSize: Size(double.infinity, 0), child: Divider()),
      leadingWidth: 0,
      leading: const SizedBox(),
      title: Image.asset(
        "assets/images/Fruit Market.png",
        width: width * 0.4,
      ),
      actions: [
        InkWell(
          onTap: widget.onTap,
          child: Image.asset(
            "assets/images/search.png",
            width: width * 0.06,
          ),
        ),
        SizedBox(
          width: width * 0.04,
        ),
        InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return const FilterDialog();
              },
            );
          },
          child: Image.asset(
            "assets/images/filter.png",
            width: width * 0.06,
          ),
        ),
        SizedBox(
          width: width * 0.02,
        ),
      ],
    );
  }
}
