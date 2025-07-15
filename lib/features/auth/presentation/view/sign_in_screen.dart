import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_adaptive_ui/di.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/manager/auth_bloc.dart';

import '../widgets/sign_in_body.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => getIt<AuthBloc>(),
          child: const SignInBody(),
        ));
  }
}
