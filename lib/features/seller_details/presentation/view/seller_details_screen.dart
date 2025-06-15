import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_search_bar.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../widgets/seller_details_body.dart';

class SellerDetailsScreen extends StatefulWidget {
  const SellerDetailsScreen({super.key});

  @override
  State<SellerDetailsScreen> createState() => _SellerDetailsScreenState();
}

class _SellerDetailsScreenState extends State<SellerDetailsScreen> {
  bool isSearchOn = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Fruit Market",
        actions: [
          InkWell(
            onTap: () {
              setState(() {
                isSearchOn = true;
              });
            },
            child: Image.asset(
              "assets/images/search.png",
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: width * 0.02,
          ),
        ],
      ),
      body: isSearchOn
          ? CustomSearchBar(
              onTap: () {
                setState(() {
                  isSearchOn = false;
                });
              },
            )
          : const SellerDetailsBody(),
    );
  }
}
