import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.widget});
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: height * 0.12,
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Colors.grey, blurStyle: BlurStyle.outer, blurRadius: 2)
            ],
            border: Border.all(width: 1, color: Colors.grey.withOpacity(0.01)),
            borderRadius: BorderRadius.circular(25)),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/home5.png"),
            ),
            widget
          ],
        ),
      ),
    );
  }
}
