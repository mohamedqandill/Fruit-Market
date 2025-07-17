import '../models/favourite_products.dart';

abstract class FavouriteRepo {
  Future<void> toggleFavourite(int favId);
  Future<FavouriteProducts> getFavourites();
}
