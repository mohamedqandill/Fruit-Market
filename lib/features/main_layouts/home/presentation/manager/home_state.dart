part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(
      {@Default(RequestState.initial) RequestState getOffersState,
      @Default(RequestState.initial) RequestState getVendorsState,
      @Default(RequestState.initial) RequestState getVendorProductsState,
      OffersModel? offersModel,
      VendorsModel? vendorsModel,
      VendorProductsModel? productsModel,
      ProductData? selectedProduct,
      String? errorMessage}) = _Initial;
}
