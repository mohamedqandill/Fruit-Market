import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/core/enum/enum.dart';
import 'package:responsive_adaptive_ui/features/auth/data/models/forget_pass_model.dart';
import 'package:responsive_adaptive_ui/features/auth/data/models/register_model.dart';
import 'package:responsive_adaptive_ui/features/auth/domain/use_cases/forget_password_use_case.dart';
import 'package:responsive_adaptive_ui/features/auth/domain/use_cases/login_use_case.dart';
import 'package:responsive_adaptive_ui/features/auth/domain/use_cases/register_use_case.dart';

part 'auth_bloc.freezed.dart';
part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;
  ForgetPasswordUseCase forgetPasswordUseCase;
  TextEditingController name = TextEditingController();
  final bool isLoading = false;
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isObscure = true;

  AuthBloc(this.registerUseCase, this.loginUseCase, this.forgetPasswordUseCase)
      : super(const AuthState.initial()) {
    on<RegisterEvent>((event, emit) async {
      try {
        emit(state.copyWith(registerState: RequestState.loading));

        final result = await registerUseCase.call(event.registerModel);
        if (result.status == true) {
          emit(state.copyWith(
            registerState: RequestState.success,
          ));
        } else {
          emit(state.copyWith(
              registerState: RequestState.error,
              errorMessage: result.errorMessage.toString()));
        }
      } catch (e) {
        emit(state.copyWith(
            registerState: RequestState.error, errorMessage: e.toString()));
      }
    });
    on<LoginEvent>((event, emit) async {
      try {
        emit(state.copyWith(loginState: RequestState.loading));

        final result = await loginUseCase.call(event.email, event.password);
        if (result.status == true) {
          emit(state.copyWith(
            loginState: RequestState.success,
          ));
        } else {
          emit(state.copyWith(
              loginState: RequestState.error,
              errorMessage: result.message.toString()));
        }
      } catch (e) {
        emit(state.copyWith(
            loginState: RequestState.error, errorMessage: e.toString()));
      }
    });
    on<ForgetPassword>((event, emit) async {
      try {
        emit(state.copyWith(forgetPassState: RequestState.loading));

        final result = await forgetPasswordUseCase.call(event.email);
        if (result.status == true) {
          emit(state.copyWith(
              forgetPassState: RequestState.success, forgetPassModel: result));
        } else {
          emit(state.copyWith(
              forgetPassState: RequestState.error,
              errorMessage: result.message.toString()));
        }
      } catch (e) {
        emit(state.copyWith(
            forgetPassState: RequestState.error, errorMessage: e.toString()));
      }
    });
  }
}
