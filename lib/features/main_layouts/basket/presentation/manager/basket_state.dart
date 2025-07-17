part of 'basket_bloc.dart';

@freezed
class BasketState with _$BasketState {
  const factory BasketState.initial(
      {@Default(RequestState.initial) RequestState getAllProductState,
      @Default(RequestState.initial) RequestState getTotalPriceState,
      @Default(RequestState.initial) RequestState increaseQuantityState,
      @Default(RequestState.initial) RequestState decreaseQuantityState,
      @Default(RequestState.initial) RequestState deleteProductState,
      List<ProductDetails>? products,
      double? totalPrice,
      String? errorMessage}) = _Initial;
}
