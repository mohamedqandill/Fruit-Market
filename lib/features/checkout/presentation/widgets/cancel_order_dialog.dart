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
              height: isLandScape ? height * 0.75 : height * 0.45,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Cancel Order",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: width * 0.045),
                  ),
                  const CustomField(title: "", label: "Cancel Reason"),
                  SizedBox(
                    height: height * 0.005,
                  ),
                  const CustomField(title: "", label: "Notes"),
                  const Spacer(),
                  Custombutton(
                    title: "Confirm Cancelation ",
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  ),
                  TextButton(
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
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
