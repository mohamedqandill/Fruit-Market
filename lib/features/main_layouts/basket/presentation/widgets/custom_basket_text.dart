import 'package:flutter/material.dart';

class CustomBasketText extends StatelessWidget {
  const CustomBasketText(
      {super.key,
      required this.title,
      required this.price,
      required this.currency,
      this.isBold = false});

  final String title;
  final bool isBold;
  final String price;
  final String currency;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              color: isBold ? Colors.black : Colors.black54,
              fontSize: isLandScape ? width * 0.03 : width * 0.04,
              fontWeight: FontWeight.bold,
              fontFamily: "Web"),
        ),
        Row(
          children: [
            Text(price,
                style: TextStyle(
                    color: Colors.black87,
                    fontSize: isLandScape ? width * 0.03 : width * 0.04,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Web")),
            Text(currency,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: isLandScape ? width * 0.03 : width * 0.037,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Web"))
          ],
        )
      ],
    );
  }
}
