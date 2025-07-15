import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/data/models/vendors_model.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/data/repo/home_repo.dart';

@injectable
class GetVendorsUseCase {
  HomeRepo homeRepo;
  GetVendorsUseCase(this.homeRepo);

  Future<VendorsModel> call() => homeRepo.getVendors();
}
