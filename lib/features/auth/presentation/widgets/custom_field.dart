import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({required this.title, required this.label, super.key});
  final String label;
  final String title;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var shortSide = MediaQuery.sizeOf(context).shortestSide;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    double maxWidth;
    if (shortSide >= 900) {
      maxWidth = width * 0.1;
    } else if (shortSide >= 600) {
      maxWidth = width * 0.65;
    } else {
      if (isLandscape) {
        maxWidth = width * 0.7;
      } else {
        maxWidth = width * 0.9;
      }
    }

    return Center(
      child: Container(
        width: maxWidth,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style:
                  const TextStyle(fontFamily: "Arial", color: Colors.black45),
            ),
            SizedBox(height: height * 0.008),
            TextFormField(
              decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(fontFamily: "Arial"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.2)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
