import 'package:flutter/material.dart';

import '../widgets/basket_body_view.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: BasketBodyView(),
    );
  }
}
