import 'package:flutter/material.dart';

import '../../../../../core/widgets/custom_app_bar.dart';
import '../widgets/seller_details_body.dart';

class SellerDetailsScreen extends StatelessWidget {
  const SellerDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.sizeOf(context).width;

    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(),
      body: SellerDetailsBody(),
    );
  }
}
