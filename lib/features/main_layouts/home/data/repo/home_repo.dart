import 'package:responsive_adaptive_ui/features/main_layouts/home/data/models/offersModel.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/data/models/vendor_products_model.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/data/models/vendors_model.dart';

abstract class HomeRepo {
  Future<OffersModel> getOffersSlider();
  Future<VendorsModel> getVendors();
  Future<VendorProductsModel> getVendorProduct(int vendorId);
}
