import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../core/widgets/custom_inline_text.dart';

class DeliveryTimeViewBody extends StatefulWidget {
  const DeliveryTimeViewBody({super.key, required this.selectedDateTime});

  final Function(String date) selectedDateTime;

  @override
  State<DeliveryTimeViewBody> createState() => _DeliveryTimeViewBodyState();
}

class _DeliveryTimeViewBodyState extends State<DeliveryTimeViewBody> {
  var selectedDate;
  var selectedItem;
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: width * 0.025),
              width: width * 0.9,
              height: isLandScape ? height * 0.18 : height * 0.06,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.04),
                  border: Border.all(width: 1, color: Colors.black26)),
              child: CustomInlineText(
                  leftTitle: "Now",
                  rightTitle: Radio(
                    value: 1,
                    groupValue: selectedItem,
                    onChanged: (value) {
                      setState(() {
                        selectedItem = value;
                        widget.selectedDateTime(
                            DateFormat('yyyy-MM-dd').format(DateTime.now()));
                      });
                    },
                  )),
            ),
            SizedBox(
              height: height * 0.018,
            ),
            Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.symmetric(horizontal: width * 0.025),
              width: width * 0.9,
              height: isLandScape ? height * 0.42 : height * 0.16,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(width * 0.04),
                  border: Border.all(width: 1, color: Colors.black26)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomInlineText(
                      leftTitle: "Select Delivery Time",
                      rightTitle: Radio(
                        value: 2,
                        groupValue: selectedItem,
                        onChanged: (value) {
                          setState(() {
                            selectedItem = value;
                            widget.selectedDateTime(DateFormat('yyyy-MM-dd')
                                .format(selectedDate ?? DateTime.now()));
                          });
                        },
                      )),
                  const Spacer(),
                  Text(
                    "Select Date",
                    style:
                        TextStyle(fontFamily: "Arial", fontSize: width * 0.04),
                  ),
                  CustomInlineText(
                      leftTitle: DateFormat('yyyy-MM-dd')
                          .format(selectedDate ?? DateTime.now()),
                      rightTitle: InkWell(
                          onTap: () async {
                            selectedDate = await chooseDate(context);
                            widget.selectedDateTime(DateFormat('yyyy-MM-dd')
                                .format(selectedDate ?? DateTime.now()));
                            setState(() {});
                          },
                          child: const Icon(Icons.expand_more))),
                  SizedBox(
                    height: height * 0.01,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<DateTime?> chooseDate(BuildContext context) async {
  var date = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)));
  return date;
}
