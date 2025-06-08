import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../widgets/seller_details_body.dart';

class SellerDetailsScreen extends StatelessWidget {
  const SellerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Fruit Market",
        actions: [
          Image.asset(
            "assets/images/search.png",
            color: Colors.black,
          ),
          SizedBox(
            width: width * 0.02,
          ),
        ],
      ),
      body: const SellerDetailsBody(),
    );
  }
}
