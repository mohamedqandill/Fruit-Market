import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/features/checkout/data/model/make_order_model.dart';
import 'package:responsive_adaptive_ui/features/checkout/data/repo/checkout_repo.dart';

@injectable
class MakeOrderUseCase {
  CheckoutRepo checkoutRepo;
  MakeOrderUseCase(this.checkoutRepo);

  Future<void> call(MakeOrderModel orders) => checkoutRepo.makeOrder(orders);
}
