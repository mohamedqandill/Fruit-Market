import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/core/apis/api_manager.dart';
import 'package:responsive_adaptive_ui/core/apis/end_points.dart';
import 'package:responsive_adaptive_ui/core/local_storage_service/prefs.dart';
import 'package:responsive_adaptive_ui/features/checkout/data/model/make_order_model.dart';
import 'package:responsive_adaptive_ui/features/checkout/data/repo/checkout_repo.dart';

import '../../../../di.dart';

@Injectable(as: CheckoutRepo)
class CheckoutRepoImpl implements CheckoutRepo {
  @override
  Future<void> makeOrder(MakeOrderModel orders) async {
    try {
      SharedPrefs prefs = SharedPrefs();
      var token = prefs.getString("token");
      await getIt<ApiManager>().postData(
          endPoints: EndPoints.checkoutOrder,
          body: orders.toJson(),
          headers: {"Authorization": "Bearer $token"});
    } catch (e) {
      rethrow;
    }
  }
}
