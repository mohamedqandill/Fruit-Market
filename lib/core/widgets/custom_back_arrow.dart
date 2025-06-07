import 'package:flutter/material.dart';

class CustomBackArrow extends StatelessWidget {
  const CustomBackArrow({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back_ios_new));
  }
}
