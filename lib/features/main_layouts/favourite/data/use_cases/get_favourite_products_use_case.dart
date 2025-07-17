import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/favourite/data/models/favourite_products.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/favourite/data/repo/favourite_repo.dart';

@injectable
class GetFavouriteProductsUseCase {
  FavouriteRepo favouriteRepo;
  GetFavouriteProductsUseCase(this.favouriteRepo);

  Future<FavouriteProducts> call() => favouriteRepo.getFavourites();
}
