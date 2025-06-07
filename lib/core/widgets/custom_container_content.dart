import 'package:flutter/material.dart';

import 'custom_container_title.dart';

class CustomContainerContent extends StatelessWidget {
  const CustomContainerContent(
      {super.key,
      required this.title,
      required this.secondInRow,
      required this.thirdInRow,
      required this.rightItem});
  final String title;
  final Widget secondInRow;
  final Widget thirdInRow;
  final Widget rightItem;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Expanded(
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(top: height * 0.008, left: height * 0.008),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomContainerTitle(title: title),
                secondInRow,
                thirdInRow,
              ],
            ),
          ),
          const Spacer(),
          rightItem
        ],
      ),
    );
  }
}
