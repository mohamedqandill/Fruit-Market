import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/basket/presentation/manager/basket_bloc.dart';

import '../widgets/basket_body_view.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => BasketBloc()
          ..add(const GetAllProduct())
          ..add(const GetTotalPrice()),
        child: const BasketBodyView(),
      ),
    );
  }
}
