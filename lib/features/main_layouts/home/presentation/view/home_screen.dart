import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_adaptive_ui/di.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/presentation/manager/home_bloc.dart';

import '../widgets/home_screen_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (context) => getIt<HomeBloc>()
          ..add(const GetOffersSlider())
          ..add(const GetVendors()),
        child: const HomeScreenBody(),
      ),
    );
  }
}
