import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/manager/auth_bloc.dart';

import '../../../../di.dart';
import '../widgets/forget_password_body.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: BlocProvider(
          create: (context) => getIt<AuthBloc>(),
          child: const ForgetPasswordBody(),
        ));
  }
}
