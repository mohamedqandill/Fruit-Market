part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial(
      {@Default(RequestState.initial) RequestState getOffersState,
      @Default(RequestState.initial) RequestState getVendorsState,
      OffersModel? offersModel,
      VendorsModel? vendorsModel,
      String? errorMessage}) = _Initial;
}
