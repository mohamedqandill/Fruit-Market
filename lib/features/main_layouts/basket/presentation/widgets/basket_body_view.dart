import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/basket/presentation/widgets/basket_body_landscape.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/basket/presentation/widgets/basket_body_portrait.dart';

class BasketBodyView extends StatelessWidget {
  const BasketBodyView({super.key});

  @override
  Widget build(BuildContext context) {
    var isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return isLandScape
        ? const BasketBodyViewLandScape()
        : const BasketBodyViewPortrait();
  }
}
