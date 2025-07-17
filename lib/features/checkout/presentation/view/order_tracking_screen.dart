import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_adaptive_ui/core/widgets/custom_app_bar.dart';
import 'package:responsive_adaptive_ui/features/checkout/presentation/manager/checkout_bloc.dart';

import '../../../../di.dart';
import '../widgets/order_tracking_view_body.dart';

class OrderTrackingScreen extends StatelessWidget {
  const OrderTrackingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: "Order Tracking", actions: []),
      body: BlocProvider(
        create: (context) => getIt<CheckoutBloc>(),
        child: const OrderTrackingViewBody(),
      ),
    );
  }
}
