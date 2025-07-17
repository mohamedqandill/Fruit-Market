part of 'favourite_bloc.dart';

@freezed
class FavouriteState with _$FavouriteState {
  const factory FavouriteState.initial(
      {@Default(RequestState.initial) RequestState toggleFavouriteState,
      @Default(RequestState.initial) RequestState getFavouriteProductsState,
      FavouriteProducts? products,
      String? errorMessage}) = _Initial;
}
