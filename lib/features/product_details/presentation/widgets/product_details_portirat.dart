import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/constants/constants.dart';
import 'package:responsive_adaptive_ui/features/seller_details/presentation/widgets/seller_details_body_portirat.dart';

import 'expandable_widget.dart';

class ProductDetailsBodyPortirat extends StatefulWidget {
  const ProductDetailsBodyPortirat({super.key});

  @override
  State<ProductDetailsBodyPortirat> createState() =>
      _ProductDetailsBodyPortiratState();
}

class _ProductDetailsBodyPortiratState
    extends State<ProductDetailsBodyPortirat> {
  String? selectedWeight;
  String? selectedAddon;

  bool weightExpanded = true;
  bool addonExpanded = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    final product =
        ModalRoute.of(context)!.settings.arguments as ProductDetails;
    print(product.subUnits.length);
    Map<String, String> weights = {
      for (var i in product.subUnits)
        if (i.subUnitEn != null && i.subPrice != null)
          i.subUnitEn!: i.subPrice!.toString()
    };

    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: width * 0.005),
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (kDebugMode) {
            print(constraints.maxWidth);
            print(constraints.maxHeight);
          }

          return GlowingOverscrollIndicator(
            color: Colors.transparent,
            axisDirection: AxisDirection.down,
            child: SingleChildScrollView(
              child: Column(
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
                          child: Image.network(
                            "$baseImageUrl${product.image}",
                            fit: BoxFit.fill,
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
                              product.categoryName,
                              style: TextStyle(
                                  fontFamily: "Web",
                                  color: primaryColor,
                                  fontSize: width * 0.043,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              product.productName.length > 20
                                  ? product.productName.substring(0, 20)
                                  : product.productName,
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
                                Text("${product.priceAfterDiscount}€",
                                    style: TextStyle(
                                        fontFamily: "Web",
                                        color: Colors.black87,
                                        fontSize: width * 0.04)),
                                SizedBox(
                                  width: width * 0.025,
                                ),
                                Text(
                                  "${product.price}€",
                                  style: TextStyle(
                                      fontFamily: "Web",
                                      color: const Color(0xffDF958F),
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
                      product.details,
                      style: TextStyle(
                          fontFamily: "Web",
                          fontSize: width * 0.039,
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
                  weights.isEmpty
                      ? const SizedBox()
                      : buildExpandableSection(
                          context: context,
                          title: "Select Quantity",
                          expanded: weightExpanded,
                          onToggle: () {
                            setState(() {
                              weightExpanded = !weightExpanded;
                              if (weightExpanded) addonExpanded = false;
                            });
                          },
                          options: weights,
                          selectedValue: selectedWeight,
                          onChanged: (val) {
                            setState(() {
                              selectedWeight = val;
                            });
                          },
                        ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
