import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/core/enum/enum.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/favourite/data/models/favourite_products.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/favourite/data/use_cases/get_favourite_products_use_case.dart';
import 'package:responsive_adaptive_ui/features/main_layouts/favourite/data/use_cases/toggle_favorite_use_case.dart';

part 'favourite_bloc.freezed.dart';
part 'favourite_event.dart';
part 'favourite_state.dart';

@injectable
class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteState> {
  ToggleFavouriteUseCase toggleFavouriteUseCase;
  GetFavouriteProductsUseCase getFavouriteProductsUseCase;

  FavouriteBloc(this.toggleFavouriteUseCase, this.getFavouriteProductsUseCase)
      : super(const FavouriteState.initial()) {
    on<ToggleFavourite>((event, emit) async {
      try {
        emit(state.copyWith(toggleFavouriteState: RequestState.loading));
        await toggleFavouriteUseCase.call(event.favId).then(
          (value) {
            emit(state.copyWith(toggleFavouriteState: RequestState.success));
          },
        );
      } catch (e) {
        emit(state.copyWith(
            toggleFavouriteState: RequestState.error,
            errorMessage: e.toString()));
      }
    });
    on<GetFavouriteProducts>((event, emit) async {
      try {
        emit(state.copyWith(getFavouriteProductsState: RequestState.loading));
        FavouriteProducts result = await getFavouriteProductsUseCase.call();
        if (result.result == true) {
          emit(state.copyWith(
              getFavouriteProductsState: RequestState.success,
              products: result));
        } else {
          emit(state.copyWith(
              getFavouriteProductsState: RequestState.error,
              errorMessage: result.errorMessageEn));
        }
      } catch (e) {
        emit(state.copyWith(
            getFavouriteProductsState: RequestState.error,
            errorMessage: e.toString()));
      }
    });
  }
}
