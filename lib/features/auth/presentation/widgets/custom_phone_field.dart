import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var shortSide = MediaQuery.sizeOf(context).shortestSide;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    double maxWidth;

    if (shortSide >= 1200) {
      maxWidth = width * 0.4;
    } else if (shortSide >= 800 && shortSide < 1200) {
      maxWidth = width * 0.6;
    } else if (shortSide >= 600 && shortSide < 800) {
      maxWidth = width * 0.75;
    } else {
      if (isLandscape) {
        maxWidth = width * 0.8;
      } else {
        maxWidth = width * 0.95;
      }
    }
    print(shortSide);
    return Center(
      child: Container(
        width: maxWidth,
        padding: EdgeInsets.symmetric(
            horizontal: isLandscape && shortSide < 600 ? width * 0.12 : 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Phone Number",
              style: TextStyle(color: Colors.black45),
            ),
            SizedBox(height: height * 0.008),
            IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Mobile Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(width * 0.5),
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5)),
                ),
              ),
              initialCountryCode: 'EG', // مصر
              onChanged: (phone) {},
            ),
          ],
        ),
      ),
    );
  }
}
