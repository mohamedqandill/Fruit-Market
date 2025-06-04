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
    if (shortSide >= 900) {
      maxWidth = width * 0.1;
    } else if (shortSide >= 600) {
      maxWidth = width * 0.65;
    } else {
      if (isLandscape) {
        maxWidth = width * 0.6;
      }
      maxWidth = width * 0.9;
    }

    return Center(
      child: Container(
        width: maxWidth,
        padding:
            EdgeInsets.symmetric(horizontal: isLandscape ? width * 0.12 : 16),
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
                  borderRadius: BorderRadius.circular(25),
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
