import 'package:flutter/material.dart';

import '../widgets/orders_screen_body.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: OrdersScreenBody(),
    );
  }
}
