import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_app_bar.dart';
import 'package:responsive_adaptive_ui/features/checkout/presentation/widgets/order_confirmation_view_body.dart';

class OrderConfirmationScreen extends StatelessWidget {
  const OrderConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "Checkout", actions: []),
      body: OrderConfirmationViewBody(),
    );
  }
}
