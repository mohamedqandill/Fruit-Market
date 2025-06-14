import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_app_bar.dart';

import '../widgets/product_details_body.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;
    var height = MediaQuery.sizeOf(context).height;
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "Product Name", actions: [
        Image.asset(
          "assets/images/fav.png",
          height: isLandScape ? height * 0.3 : height * 0.07,
          color: Colors.black,
        ),
        Icon(
          Icons.ios_share_outlined,
          size: isLandScape ? width * 0.05 : width * 0.07,
        ),
        SizedBox(
          width: width * 0.02,
        )
      ]),
      body: const ProductDetailsBody(),
    );
  }
}
