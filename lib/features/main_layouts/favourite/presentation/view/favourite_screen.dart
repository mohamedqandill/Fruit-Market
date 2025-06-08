import 'package:flutter/material.dart';

import '../widgets/stl.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: FavouriteBodyScreen(),
    );
  }
}
