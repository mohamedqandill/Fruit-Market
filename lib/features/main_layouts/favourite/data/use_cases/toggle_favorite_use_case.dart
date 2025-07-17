import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/favourite/data/repo/favourite_repo.dart';

@injectable
class ToggleFavouriteUseCase {
  FavouriteRepo favouriteRepo;
  ToggleFavouriteUseCase(this.favouriteRepo);

  Future<void> call(int favId) => favouriteRepo.toggleFavourite(favId);
}
