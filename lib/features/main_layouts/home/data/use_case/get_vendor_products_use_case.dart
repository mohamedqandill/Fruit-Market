import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/data/models/vendor_products_model.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/data/repo/home_repo.dart';

@injectable
class GetVendorProductsUseCase {
  HomeRepo homeRepo;

  GetVendorProductsUseCase(this.homeRepo);

  Future<VendorProductsModel> call(int vendorId) =>
      homeRepo.getVendorProduct(vendorId);
}
