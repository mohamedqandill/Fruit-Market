import 'package:flutter/material.dart';

import '../../../core/widgets/customButton.dart';

class FilterDialog extends StatefulWidget {
  const FilterDialog({super.key});

  @override
  State<FilterDialog> createState() => _FiltergState();
}

class _FiltergState extends State<FilterDialog> {
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
            print(constraints.maxWidth);
            return Container(
              padding: EdgeInsets.all(width * 0.04),
              height: isLandScape
                  ? height * 0.99
                  : constraints.maxWidth <= 366
                      ? height * 0.52
                      : constraints.maxWidth > 600
                          ? height * 0.6
                          : height * 0.48,
              child: isLandScape
                  ? SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            "Filter by ",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: width * 0.045),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Row(
                            children: [
                              Text(
                                "Delivery To",
                                style: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width * 0.041),
                              ),
                              SizedBox(
                                width: width * 0.03,
                              ),
                              Image.asset("assets/images/delivIcon.png"),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Container(
                            width: double.infinity,
                            height: constraints.maxWidth > 600
                                ? height * 0.08
                                : height * 0.2,
                            decoration: BoxDecoration(
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurStyle: BlurStyle.outer,
                                      blurRadius: 2)
                                ],
                                border: Border.all(
                                    width: 1,
                                    color: Colors.grey.withOpacity(0.01)),
                                borderRadius:
                                    BorderRadius.circular(width * 0.05)),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.keyboard_arrow_down_sharp,
                                  size: width * 0.1,
                                ),
                                Text(
                                  "All Area ",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: width * 0.045),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.5,
                                child: Radio(
                                  value: 1,
                                  groupValue: selectedLanguage,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedLanguage = value!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(
                                'Offers',
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    color: Colors.black45,
                                    fontFamily: "Web"),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: constraints.maxWidth < 380
                                ? height * 0.005
                                : height * 0.01,
                          ),
                          Row(
                            children: [
                              Transform.scale(
                                scale: 1.5,
                                child: Radio(
                                  value: 2,
                                  groupValue: selectedLanguage,
                                  onChanged: (value) {
                                    setState(() {
                                      selectedLanguage = value!;
                                    });
                                  },
                                ),
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              Text(
                                'Free Delivery',
                                style: TextStyle(
                                    fontSize: width * 0.05,
                                    color: Colors.black45,
                                    fontFamily: "Web"),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.03),
                            child: Custombutton(
                              title: "Apply Filter",
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              isSmall: true,
                            ),
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
                              ))
                        ],
                      ),
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Filter by ",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: width * 0.045),
                        ),
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Row(
                          children: [
                            Text(
                              "Delivery To",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400,
                                  fontSize: width * 0.041),
                            ),
                            SizedBox(
                              width: width * 0.03,
                            ),
                            Image.asset("assets/images/delivIcon.png"),
                          ],
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Container(
                          width: double.infinity,
                          height: isLandScape
                              ? height * 0.2
                              : constraints.maxWidth > 600
                                  ? height * 0.15
                                  : height * 0.05,
                          decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    blurStyle: BlurStyle.outer,
                                    blurRadius: 2)
                              ],
                              border: Border.all(
                                  width: 1,
                                  color: Colors.grey.withOpacity(0.01)),
                              borderRadius:
                                  BorderRadius.circular(width * 0.05)),
                          child: Row(
                            children: [
                              Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: width * 0.1,
                              ),
                              Text(
                                "All Area ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                    fontSize: width * 0.045),
                              ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Radio(
                                value: 1,
                                groupValue: selectedLanguage,
                                onChanged: (value) {
                                  setState(() {
                                    selectedLanguage = value!;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Text(
                              'Offers',
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  color: Colors.black45,
                                  fontFamily: "Web"),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: constraints.maxWidth < 380
                              ? height * 0.005
                              : height * 0.01,
                        ),
                        Row(
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Radio(
                                value: 2,
                                groupValue: selectedLanguage,
                                onChanged: (value) {
                                  setState(() {
                                    selectedLanguage = value!;
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Text(
                              'Free Delivery',
                              style: TextStyle(
                                  fontSize: width * 0.05,
                                  color: Colors.black45,
                                  fontFamily: "Web"),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Padding(
                          padding:
                              EdgeInsets.symmetric(horizontal: width * 0.03),
                          child: Custombutton(
                            title: "Apply Filter",
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            isSmall: true,
                          ),
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
                            ))
                      ],
                    ),
            );
          },
        ),
      ),
    );
  }
}
