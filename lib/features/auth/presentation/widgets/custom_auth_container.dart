import 'package:flutter/material.dart';

class CustomAuthContainer extends StatelessWidget {
  const CustomAuthContainer(
      {required this.title,
      required this.color,
      this.widthFraction = 0.8,
      this.heightFraction = 0.06,
      required this.textColor,
      required this.image,
      super.key});

  final String image;
  final String title;
  final Color color;
  final Color textColor;
  final num widthFraction;
  final num heightFraction;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Center(
      child: Container(
        width: width * widthFraction,
        height: isLandScape ? height * 0.095 : height * heightFraction,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(width * 0.5)),
            border: Border.all(width: 1, color: Colors.grey.withOpacity(0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Image.asset(image),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                return Text(
                  title,
                  style: TextStyle(
                      fontFamily: "Arial",
                      fontSize: constraints.maxWidth > 650
                          ? width * 0.03
                          : width * 0.04,
                      color: textColor),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
