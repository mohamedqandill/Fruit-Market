import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/constants/constants.dart';

class ProductDetailsBody extends StatefulWidget {
  const ProductDetailsBody({super.key});

  @override
  State<ProductDetailsBody> createState() => _ProductDetailsBodyState();
}

class _ProductDetailsBodyState extends State<ProductDetailsBody> {
  String? selectedWeight;
  String? selectedAddon;

  bool weightExpanded = true;
  bool addonExpanded = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: width * 0.005),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (kDebugMode) {
            print(constraints.maxWidth);
            print(constraints.maxHeight);
          }
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: constraints.maxHeight < 639
                        ? height * 0.2
                        : constraints.maxWidth < 383
                            ? height * 0.171
                            : constraints.maxWidth >= 600
                                ? height * 0.22
                                : height * 0.27,
                    width: constraints.maxWidth >= 650
                        ? width * 0.98
                        : width * 0.98,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        "assets/images/image 10.png",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    right: width * 0.04,
                    top: width * 0.04,
                    child: Container(
                        width: width * 0.31,
                        height: height * 0.031,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(width: 1, color: Colors.grey),
                            borderRadius: BorderRadius.circular(width * 0.5)),
                        child: Center(
                            child: Text(
                          "10% Off Discount",
                          style: TextStyle(
                              color: Colors.black38,
                              fontFamily: "Web",
                              fontSize: width * 0.035),
                        ))),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Category Name",
                          style: TextStyle(
                              fontFamily: "Web",
                              color: primaryColor,
                              fontSize: width * 0.043,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Product Name",
                          style: TextStyle(
                              fontFamily: "ArialBold",
                              fontSize: width * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Column(
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                              fontFamily: "Web",
                              fontSize: width * 0.04,
                              color: Colors.black26),
                        ),
                        Row(
                          children: [
                            Text("KD12.00",
                                style: TextStyle(
                                    fontFamily: "Web",
                                    color: Colors.black87,
                                    fontSize: width * 0.04)),
                            SizedBox(
                              width: width * 0.025,
                            ),
                            Text(
                              "KD14.00",
                              style: TextStyle(
                                  fontFamily: "Web",
                                  color: Color(0xffDF958F),
                                  decoration: TextDecoration.lineThrough,
                                  fontSize: width * 0.04),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.01),
                child: Text(
                  """Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.""",
                  style: TextStyle(
                      fontFamily: "Web",
                      fontSize: width * 0.038,
                      color: Colors.black54),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.015),
                child: Text(
                  "Sell Per : Kartoon",
                  style: TextStyle(
                      fontFamily: "Web",
                      fontSize: width * 0.04,
                      color: Colors.black54),
                ),
              ),
              buildExpandableSection(
                context: context,
                title: "Select weight",
                expanded: weightExpanded,
                onToggle: () {
                  setState(() {
                    weightExpanded = !weightExpanded;
                    if (weightExpanded) addonExpanded = false;
                  });
                },
                options: {
                  "50g": "50 Gram - 4.00 KD",
                  "1kg": "1 Kg - 6.25 KD",
                  "2kg": "2 Kg - 12.00 KD",
                },
                selectedValue: selectedWeight,
                onChanged: (val) {
                  setState(() {
                    selectedWeight = val;
                  });
                },
              ),

              /// Addons Section
              buildExpandableSection(
                context: context,
                title: "Select Addons",
                expanded: addonExpanded,
                onToggle: () {
                  setState(() {
                    addonExpanded = !addonExpanded;
                    if (addonExpanded) weightExpanded = false;
                  });
                },
                options: {
                  "addon1": "50 Gram - 4.00 KD",
                  "addon2": "1 Kg - 6.25 KD",
                },
                selectedValue: selectedAddon,
                onChanged: (val) {
                  setState(() {
                    selectedAddon = val;
                  });
                },
              ),

              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor.withOpacity(0.77),
                          fixedSize: Size(
                              width * 0.42,
                              constraints.maxWidth >= 600
                                  ? height * 0.045
                                  : height * 0.03)),
                      onPressed: () {},
                      child: Center(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/basket.png",
                              height: height * 0.21,
                              width: width * 0.085,
                            ),
                            Text(
                              "Add To Cart",
                              style: TextStyle(
                                  fontFamily: "Web",
                                  color: Colors.white,
                                  fontSize: width * 0.04),
                            ),
                          ],
                        ),
                      )),
                ],
              )
            ],
          );
        },
      ),
    );
  }
}

Widget buildExpandableSection({
  required String title,
  required bool expanded,
  required VoidCallback onToggle,
  required Map<String, String> options,
  required String? selectedValue,
  required Function(String?) onChanged,
  required BuildContext context,
}) {
  var width = MediaQuery.sizeOf(context).width;

  return Container(
    decoration: BoxDecoration(
      border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
      borderRadius: BorderRadius.circular(12),
    ),
    child: Column(
      children: [
        ListTile(
          title: Text(title,
              style: TextStyle(
                  fontSize: width * 0.045,
                  fontFamily: "Web",
                  fontWeight: FontWeight.bold)),
          trailing: Icon(
            expanded ? Icons.expand_less : Icons.expand_more,
            color: Colors.grey,
          ),
          onTap: onToggle,
        ),
        if (expanded)
          Padding(
            padding: EdgeInsets.zero,
            child: Column(
              children: options.entries.map((entry) {
                return Padding(
                  padding: EdgeInsets.zero,
                  child: RadioListTile<String>(
                    contentPadding: EdgeInsets.zero,
                    dense: true,
                    visualDensity: VisualDensity.compact,
                    value: entry.key,
                    groupValue: selectedValue,
                    title: Text(entry.value,
                        style: TextStyle(
                          fontSize: width * 0.038,
                          color: Colors.black54,
                          fontFamily: "Web",
                        )),
                    activeColor: Colors.green,
                    onChanged: onChanged,
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    ),
  );
}
