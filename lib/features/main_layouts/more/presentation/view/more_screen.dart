import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/more/presentation/widgets/more_screen_body.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: MoreScreenBody(),
    );
  }
}
