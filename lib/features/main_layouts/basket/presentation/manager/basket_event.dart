part of 'basket_bloc.dart';

@freezed
class BasketEvent with _$BasketEvent {
  const factory BasketEvent.started() = _Started;
  const factory BasketEvent.getAllProduct() = GetAllProduct;
  const factory BasketEvent.deleteProduct(int id) = DeleteProduct;
  const factory BasketEvent.increaseProduct(int id) = IncreaseProduct;
  const factory BasketEvent.decreaseProduct(int id) = DecreaseProduct;
  const factory BasketEvent.getTotalPrice() = GetTotalPrice;
}
