import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_adaptive_ui/core/widgets/customButton.dart';
import 'package:responsive_adaptive_ui/features/auth/presentation/widgets/custom_auth_title.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/enum/enum.dart';
import '../manager/auth_bloc.dart';
import 'custom_field.dart';

class ForgetPasswordBody extends StatelessWidget {
  const ForgetPasswordBody({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;

    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.forgetPassState == RequestState.loading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
              if (state.forgetPassState == RequestState.error) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorMessage!)));
              }
              if (state.forgetPassState == RequestState.success) {
                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    backgroundColor: Colors.white,
                    content: Text(
                      "Successful",
                      style: TextStyle(color: primaryColor),
                    )));
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
                      height: height * 0.06,
                    ),
                    const CustomAuthTitle(title: "Enter Your Email"),
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
                      label: "Email",
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    Center(
                      child: Custombutton(
                        title: "Submit",
                        onPressed: () {
                          if (authBloc.formKey.currentState!.validate()) {
                            authBloc.add(ForgetPassword(authBloc.email.text));
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    state.forgetPassState == RequestState.success
                        ? Center(
                            child: Text(
                              "Your New Password Is :${state.forgetPassModel?.data?.newPassword ?? ""}",
                              style: TextStyle(
                                  fontSize: height * 0.025,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : const SizedBox()
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
