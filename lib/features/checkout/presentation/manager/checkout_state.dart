part of 'checkout_bloc.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial(
      {@Default(RequestState.initial) RequestState makeOrderState,
      String? errorMessage}) = _Initial;
}
