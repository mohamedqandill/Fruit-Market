import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/constants/constants.dart';

import 'expandable_widget.dart';

class ProductDetailsBodyLandScape extends StatefulWidget {
  const ProductDetailsBodyLandScape({super.key});

  @override
  State<ProductDetailsBodyLandScape> createState() =>
      _ProductDetailsBodyLandScapeState();
}

class _ProductDetailsBodyLandScapeState
    extends State<ProductDetailsBodyLandScape> {
  String? selectedWeight;
  String? selectedAddon;

  bool weightExpanded = true;
  bool addonExpanded = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width * 0.03, vertical: width * 0.005),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: height * 0.4,
                          width: constraints.maxWidth >= 650
                              ? width * 0.98
                              : width * 0.98,
                          child: AspectRatio(
                            aspectRatio: 1,
                            child: Image.asset(
                              "assets/images/image 10.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        Positioned(
                          right: width * 0.01,
                          top: width * 0.04,
                          child: Container(
                              width: width * 0.31,
                              height: height * 0.1,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(width: 1, color: Colors.grey),
                                  borderRadius:
                                      BorderRadius.circular(width * 0.5)),
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
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: height * 0.01,
              right: width * 0.01,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: primaryColor.withOpacity(0.77),
                      fixedSize: Size(
                          width * 0.39,
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
            )
          ],
        );
      },
    );
  }
}
