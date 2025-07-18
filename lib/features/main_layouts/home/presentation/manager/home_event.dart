part of 'home_bloc.dart';

@freezed
class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started() = _Started;
  const factory HomeEvent.getOffers() = GetOffersSlider;
  const factory HomeEvent.getVendors() = GetVendors;
  const factory HomeEvent.getVendorProducts(int vendorId) = GetVendorProducts;
  const factory HomeEvent.setProduct(ProductData product) = SetProduct;
}
