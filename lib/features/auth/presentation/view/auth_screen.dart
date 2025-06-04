import 'package:flutter/material.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/widgets/auth_view_body.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.white, body: AuthViewBody());
  }
}
