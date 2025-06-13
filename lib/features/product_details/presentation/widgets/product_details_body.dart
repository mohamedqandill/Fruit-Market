import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/features/product_details/presentation/widgets/product_details_landscape.dart';
import 'package:responsive_adaptive_ui/features/product_details/presentation/widgets/product_details_portirat.dart';

class ProductDetailsBody extends StatelessWidget {
  const ProductDetailsBody({super.key});

  @override
  Widget build(BuildContext context) {
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return isLandScape
        ? const ProductDetailsBodyLandScape()
        : const ProductDetailsBodyPortirat();
  }
}
