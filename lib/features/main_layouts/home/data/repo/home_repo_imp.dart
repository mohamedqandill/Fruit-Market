import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/core/apis/api_manager.dart';
import 'package:responsive_adaptive_ui/core/apis/end_points.dart';
import 'package:responsive_adaptive_ui/di.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/data/models/offersModel.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/data/models/vendor_products_model.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/data/models/vendors_model.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/data/repo/home_repo.dart';

@Injectable(as: HomeRepo)
class HomeRepoImp implements HomeRepo {
  @override
  Future<OffersModel> getOffersSlider() async {
    try {
      final response =
          await getIt<ApiManager>().getData(endPoints: EndPoints.offers);
      var data = OffersModel.fromJson(response.data);

      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<VendorsModel> getVendors() async {
    try {
      final response =
          await getIt<ApiManager>().getData(endPoints: EndPoints.vendors);
      var data = VendorsModel.fromJson(response.data);
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<VendorProductsModel> getVendorProduct(int vendorId) async {
    try {
      final response = await getIt<ApiManager>().getData(
          endPoints: EndPoints.vendorProducts, params: {"vendor_id": vendorId});
      var data = VendorProductsModel.fromJson(response.data);
      return data;
    } catch (e) {
      rethrow;
    }
  }
}
