import '../model/make_order_model.dart';

abstract class CheckoutRepo {
  Future<void> makeOrder(MakeOrderModel orders);
}
