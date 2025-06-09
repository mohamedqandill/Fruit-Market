import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/features/checkout/presentation/widgets/order_error_view_body.dart';

import '../../../../core/widgets/custom_app_bar.dart';

class OrderErrorScreen extends StatelessWidget {
  const OrderErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "Checkout", actions: []),
      body: OrderErrorViewBody(),
    );
  }
}
