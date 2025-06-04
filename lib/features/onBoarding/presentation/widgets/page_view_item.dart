import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({required this.title, required this.subTitle, super.key});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(child: Image.asset("assets/images/delivery.png")),
        SizedBox(
          height: height * 0.0,
        ),
        Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        SizedBox(height: height * 0.0),
        Text(
          subTitle,
          style: TextStyle(fontSize: 16),
        )
      ],
    );
  }
}
