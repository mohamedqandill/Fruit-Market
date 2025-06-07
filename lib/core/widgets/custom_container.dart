import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer(
      {super.key,
      this.image = "assets/images/home5.png",
      required this.widget,
      required this.onPressed});
  final Widget widget;
  final VoidCallback onPressed;
  final String image;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return InkWell(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        height: height * 0.12,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, blurStyle: BlurStyle.outer, blurRadius: 2)
            ],
            border: Border.all(width: 1, color: Colors.grey.withOpacity(0.01)),
            borderRadius: BorderRadius.circular(width * 0.05)),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(width * 0.02),
              child: Image.asset(image),
            ),
            widget
          ],
        ),
      ),
    );
  }
}
