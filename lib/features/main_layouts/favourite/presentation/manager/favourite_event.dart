part of 'favourite_bloc.dart';

@freezed
class FavouriteEvent with _$FavouriteEvent {
  const factory FavouriteEvent.started() = _Started;
  const factory FavouriteEvent.toggleFavourite(int favId) = ToggleFavourite;
  const factory FavouriteEvent.getFavouriteProducts() = GetFavouriteProducts;
}
