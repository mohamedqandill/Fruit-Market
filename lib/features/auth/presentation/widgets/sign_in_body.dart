import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_adaptive_ui/core/routes_manager/routes.dart';
import 'package:responsive_adaptive_ui/core/widgets/customButton.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/widgets/custom_auth_title.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/widgets/custom_text.dart';

import '../../../../core/enum/enum.dart';
import '../manager/auth_bloc.dart';
import 'custom_field.dart';
import 'custom_underlined_text.dart';

class SignInBody extends StatefulWidget {
  const SignInBody({super.key});

  @override
  State<SignInBody> createState() => _SignInBodyState();
}

class _SignInBodyState extends State<SignInBody> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    var shortSide = MediaQuery.sizeOf(context).shortestSide;
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    double maxPadding;
    if (shortSide >= 900) {
      maxPadding = width * 0.15;
    } else if (shortSide >= 600) {
      maxPadding = width * 0.18;
    } else {
      if (isLandscape) {
        maxPadding = width * 0.14;
      } else {
        maxPadding = width * 0.038;
      }
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.loginState == RequestState.loading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state.loginState == RequestState.error) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage!)));
              }
              if (state.loginState == RequestState.success) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Login Successfully")));
                Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    Navigator.pushReplacementNamed(
                        context, Routes.mainLayoutRoute);
                  },
                );
              }
            },
            builder: (context, state) {
              var authBloc = BlocProvider.of<AuthBloc>(context);
              return Form(
                key: authBloc.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: isLandscape ? height * 0.01 : height * 0.03,
                    ),
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          size: 30,
                        )),
                    SizedBox(
                      height: isLandscape ? height * 0.01 : height * 0.06,
                    ),
                    const CustomAuthTitle(title: "Login To Wikala"),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    CustomField(
                      textEditingController: authBloc.email,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Valid Email";
                        }
                        if (!RegExp(
                                "^[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*")
                            .hasMatch(value)) {
                          return "Enter A Valid Email";
                        }
                        return null;
                      },
                      title: "Email",
                      label: "email",
                    ),
                    SizedBox(
                      height: height * 0.028,
                    ),
                    CustomField(
                      textEditingController: authBloc.password,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Password";
                        }

                        return null;
                      },
                      title: "Password",
                      label: "Password",
                      isObscure: authBloc.isObscure,
                      suffixIcon: InkWell(
                          onTap: () {
                            authBloc.isObscure = !authBloc.isObscure;
                            setState(() {});
                          },
                          child: authBloc.isObscure
                              ? const Icon(Icons.visibility_off)
                              : const Icon(Icons.visibility)),
                    ),
                    SizedBox(
                      height: height * 0.007,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: maxPadding),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          CustomUnderlinedText(
                            onPressed: () {
                              Navigator.pushNamed(
                                  context, Routes.forgetPasswordRoute);
                            },
                            text: "Forget Password?",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Center(
                      child: Custombutton(
                        title: "Login",
                        onPressed: () {
                          if (authBloc.formKey.currentState!.validate()) {
                            authBloc.add(LoginEvent(
                                authBloc.email.text, authBloc.password.text));
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    CustomText(
                        firstString: "Don’t have an account? ",
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.signupRoute);
                        },
                        secondString: "Sign Up")
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
