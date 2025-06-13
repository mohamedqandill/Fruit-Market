import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/features/seller_details/presentation/widgets/seller_details_body_landscape.dart';
import 'package:responsive_adaptive_ui/features/seller_details/presentation/widgets/seller_details_body_portirat.dart';

class SellerDetailsBody extends StatelessWidget {
  const SellerDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return isLandScape
        ? const SellerDetailsBodyLandScape()
        : const SellerDetailsBodyPortirat();
  }
}
