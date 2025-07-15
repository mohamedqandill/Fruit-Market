import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_adaptive_ui/core/constants/constants.dart';
import 'package:responsive_adaptive_ui/core/enum/enum.dart';
import 'package:responsive_adaptive_ui/core/widgets/customButton.dart';
import 'package:responsive_adaptive_ui/features/auth/data/models/register_model.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/widgets/custom_auth_title.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/widgets/custom_text.dart';

import '../../../../core/routes_manager/routes.dart';
import '../manager/auth_bloc.dart';
import 'custom_field.dart';
import 'custom_phone_field.dart';

class SignUpBody extends StatefulWidget {
  const SignUpBody({super.key});

  @override
  State<SignUpBody> createState() => _SignUpBodyState();
}

class _SignUpBodyState extends State<SignUpBody> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.registerState == RequestState.loading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state.registerState == RequestState.error) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage!)));
              }
              if (state.registerState == RequestState.success) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.white,
                    content: Text(
                      "Account created Successfully ",
                      style: TextStyle(color: primaryColor),
                    )));
                Future.delayed(
                  const Duration(seconds: 1),
                  () {
                    Navigator.pop(context);
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
                      height: height * 0.03,
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
                      height: height * 0.02,
                    ),
                    const CustomAuthTitle(title: "Sign Up To Wikala"),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    CustomField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "You should enter name";
                        }
                        return null;
                      },
                      textEditingController: authBloc.name,
                      title: "Full Name",
                      label: "First and Last Name",
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    CustomPhoneField(
                      textEditingController: authBloc.phone,
                    ),
                    SizedBox(
                      height: height * 0.003,
                    ),
                    CustomField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Email";
                        }
                        if (!RegExp(
                                "^[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*@[a-zA-Z0-9]+(?:\.[a-zA-Z0-9]+)*")
                            .hasMatch(value)) {
                          return "Enter A Valid Email";
                        }
                        return null;
                      },
                      textEditingController: authBloc.email,
                      title: "Email",
                      label: "Email",
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    CustomField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Enter Your Password";
                        }
                        return null;
                      },
                      textEditingController: authBloc.password,
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
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Center(
                      child: Custombutton(
                        title: "Sign Up",
                        onPressed: () {
                          if (authBloc.formKey.currentState!.validate()) {
                            RegisterModel registerModel = RegisterModel(
                                name: authBloc.name.text,
                                phone: "0${authBloc.phone.text}",
                                email: authBloc.email.text,
                                password: authBloc.password.text);
                            authBloc.add(RegisterEvent(registerModel));
                          }
                        },
                      ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    CustomText(
                        firstString: "Already have an account? ",
                        onPressed: () {
                          Navigator.pushReplacementNamed(
                              context, Routes.signInRoute);
                        },
                        secondString: "Login")
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
