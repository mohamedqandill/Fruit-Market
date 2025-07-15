part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.started() = _Started;
  const factory AuthEvent.register(RegisterModel registerModel) = RegisterEvent;
  const factory AuthEvent.login(String email, String password) = LoginEvent;
  const factory AuthEvent.forgetPassword(String email) = ForgetPassword;
}
