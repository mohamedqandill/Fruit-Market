import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/favourite/presentation/manager/favourite_bloc.dart';

import '../../../../../di.dart';
import '../widgets/favourite_screen_body.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          getIt<FavouriteBloc>()..add(const GetFavouriteProducts()),
      child: const Scaffold(
        backgroundColor: Colors.white,
        body: FavouriteBodyScreen(),
      ),
    );
  }
}
