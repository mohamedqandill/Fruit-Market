part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial(
      {@Default(RequestState.initial) RequestState registerState,
      @Default(RequestState.initial) RequestState loginState,
      @Default(RequestState.initial) RequestState forgetPassState,
      ForgetPassModel? forgetPassModel,
      String? errorMessage}) = _Initial;
}
