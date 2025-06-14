import 'package:flutter/material.dart';

import '../../../../../core/widgets/customButton.dart';
import '../../../auth/presentation/widgets/custom_field.dart';

class CancelOrderDialog extends StatefulWidget {
  const CancelOrderDialog({super.key});

  @override
  State<CancelOrderDialog> createState() => _CancelOrderDialogState();
}

class _CancelOrderDialogState extends State<CancelOrderDialog> {
  var selectedLanguage;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return LayoutBuilder(
      builder: (context, constraints) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(width * 0.05),
        ),
        child: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: EdgeInsets.all(width * 0.04),
              height: isLandScape ? height * 0.75 : height * 0.49,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Text(
                      "Cancel Order",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: width * 0.045),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  const Text(
                    "Reason",
                    style:
                        TextStyle(fontFamily: "Arial", color: Colors.black45),
                  ),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.03),
                    width: double.infinity,
                    height: constraints.maxWidth > 600
                        ? height * 0.08
                        : height * 0.055,
                    decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurStyle: BlurStyle.outer,
                              blurRadius: 2)
                        ],
                        border: Border.all(
                            width: 1, color: Colors.grey.withOpacity(0.01)),
                        borderRadius: BorderRadius.circular(width * 0.05)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Please Select Reason ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: width * 0.045),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: width * 0.1,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: height * 0.015,
                  ),
                  const CustomField(maxLines: 2, title: "Notes", label: ""),
                  const Spacer(),
                  Center(
                    child: Custombutton(
                      title: "Confirm Cancelation ",
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  ),
                  Center(
                    child: TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text(
                          "Close",
                          style: TextStyle(
                              color: Colors.grey,
                              fontFamily: "Web",
                              fontSize: width * 0.04),
                        )),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
