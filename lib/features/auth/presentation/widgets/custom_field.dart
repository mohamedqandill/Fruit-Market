import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {required this.title, required this.label, super.key, this.maxLines = 1});

  final String label;
  final String title;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var shortSide = MediaQuery.sizeOf(context).shortestSide;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    double maxWidth;
    if (shortSide >= 1200) {
      maxWidth = width * 0.07;
    } else if (shortSide >= 900) {
      maxWidth = width * 0.99;
    } else if (shortSide >= 600) {
      maxWidth = width * 0.6;
    } else {
      if (isLandscape) {
        maxWidth = width * 0.6;
      } else {
        maxWidth = width * 0.9;
      }
    }

    return Center(
      child: Container(
        width: maxWidth,
        padding: EdgeInsets.symmetric(
            horizontal: shortSide >= 900 ? width * 0.2 : 16),
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
              maxLines: maxLines,
              decoration: InputDecoration(
                labelText: label,
                labelStyle: const TextStyle(fontFamily: "Arial"),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                      maxLines == 1 ? width * 0.5 : width * 0.05),
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
