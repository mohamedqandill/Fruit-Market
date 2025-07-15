import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/data/models/offersModel.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/data/repo/home_repo.dart';

@injectable
class GetOffersUseCase {
  HomeRepo homeRepo;
  GetOffersUseCase(this.homeRepo);

  Future<OffersModel> call() => homeRepo.getOffersSlider();
}
