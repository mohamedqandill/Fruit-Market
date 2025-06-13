import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_inline_text.dart';

class DeliveryAddressViewBody extends StatelessWidget {
  const DeliveryAddressViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return SizedBox(
      height: height * 0.52,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Select Delivery Address",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: width * 0.048,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Sogeo UI")),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.025),
              width: width * 0.9,
              height: isLandScape ? height * 0.18 : height * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.04),
                  border: Border.all(width: 1, color: Colors.black26)),
              child: CustomInlineText(
                  leftTitle: "Add New Address",
                  rightTitle: Icon(
                    Icons.add,
                    size: width * 0.08,
                  )),
            ),
            SizedBox(
              height: height * 0.018,
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: width * 0.025),
              width: width * 0.9,
              height: isLandScape ? height * 0.41 : height * 0.19,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.04),
                  border: Border.all(width: 1, color: Colors.black26)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/Shape 17.png"),
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            "Address 1",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: width * 0.045,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Web"),
                          ),
                        ],
                      ),
                      Radio(
                        value: 1,
                        groupValue: 1,
                        onChanged: (value) {},
                      )
                    ],
                  ),
                  Text(
                    "John Doe",
                    style: TextStyle(
                        fontFamily: "Web",
                        fontSize: width * 0.04,
                        color: Colors.black54),
                  ),
                  Text(
                    "+000-11-1234567",
                    style: TextStyle(
                        fontFamily: "Web",
                        fontSize: width * 0.04,
                        color: Colors.black54),
                  ),
                  Expanded(
                    child: Text(
                      """ Room # 1 - Ground Floor, Al Najoum Building, 24 B Street, Dubai - United Arab Emirates""",
                      style: TextStyle(
                          fontFamily: "Web",
                          fontSize: width * 0.04,
                          color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
