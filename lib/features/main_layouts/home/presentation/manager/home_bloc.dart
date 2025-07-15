import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/core/enum/enum.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/data/models/offersModel.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/data/models/vendors_model.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/home/data/use_case/get_offers_use_case.dart';

import '../../data/use_case/get_vendors_use_case.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

@injectable
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  GetOffersUseCase getOffersUseCase;
  GetVendorsUseCase getVendorsUseCase;
  HomeBloc(this.getOffersUseCase, this.getVendorsUseCase)
      : super(const HomeState.initial()) {
    on<GetOffersSlider>((event, emit) async {
      try {
        emit(state.copyWith(getOffersState: RequestState.loading));
        var result = await getOffersUseCase.call();
        if (result.result == true) {
          emit(state.copyWith(
              getOffersState: RequestState.success, offersModel: result));
        } else {
          emit(state.copyWith(
              getOffersState: RequestState.error,
              errorMessage: result.errorMessage));
        }
      } catch (e) {
        emit(state.copyWith(
            getOffersState: RequestState.error, errorMessage: e.toString()));
      }
    });
    on<GetVendors>((event, emit) async {
      try {
        emit(state.copyWith(getVendorsState: RequestState.loading));
        var result = await getVendorsUseCase.call();
        if (result.status == true) {
          emit(state.copyWith(
              getVendorsState: RequestState.success, vendorsModel: result));
        }
      } catch (e) {
        emit(state.copyWith(
            getVendorsState: RequestState.error, errorMessage: e.toString()));
      }
    });
  }
}
