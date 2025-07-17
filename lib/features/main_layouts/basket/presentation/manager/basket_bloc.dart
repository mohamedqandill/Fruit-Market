import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:responsive_adaptive_ui/core/enum/enum.dart';
import 'package:responsive_adaptive_ui/core/local_storage_service/hive.dart';
import 'package:responsive_adaptive_ui/features/seller_details/presentation/widgets/seller_details_body_portirat.dart';

part 'basket_bloc.freezed.dart';
part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(const BasketState.initial()) {
    on<GetAllProduct>((event, emit) async {
      try {
        emit(state.copyWith(getAllProductState: RequestState.loading));

        var result = await HiveCart.getAllProducts();
        emit(state.copyWith(
            getAllProductState: RequestState.success, products: result));
      } catch (e) {
        emit(state.copyWith(
            getAllProductState: RequestState.error,
            errorMessage: e.toString()));
      }
    });
    on<GetTotalPrice>((event, emit) async {
      try {
        emit(state.copyWith(getTotalPriceState: RequestState.loading));
        var result = await HiveCart.getTotalPrice();
        emit(state.copyWith(
            getTotalPriceState: RequestState.success, totalPrice: result));
      } catch (e) {
        emit(state.copyWith(
            getTotalPriceState: RequestState.error,
            errorMessage: e.toString()));
      }
    });
    on<DeleteProduct>((event, emit) async {
      try {
        emit(state.copyWith(deleteProductState: RequestState.loading));
        await HiveCart.deleteProduct(event.id);
        emit(state.copyWith(deleteProductState: RequestState.success));
        var updatedProducts = await HiveCart.getAllProducts();
        var updatedTotalPrice = await HiveCart.getTotalPrice();

        emit(state.copyWith(
          deleteProductState: RequestState.success,
          products: updatedProducts,
          totalPrice: updatedTotalPrice,
        ));
      } catch (e) {
        emit(state.copyWith(
            deleteProductState: RequestState.error,
            errorMessage: e.toString()));
      }
    });
    on<IncreaseProduct>((event, emit) async {
      try {
        emit(state.copyWith(increaseQuantityState: RequestState.loading));
        await HiveCart.increaseQuantity(event.id);
        emit(state.copyWith(increaseQuantityState: RequestState.success));
        var updatedTotalPrice = await HiveCart.getTotalPrice();
        var updatedProducts = await HiveCart.getAllProducts();

        emit(state.copyWith(
          increaseQuantityState: RequestState.success,
          products: updatedProducts,
          totalPrice: updatedTotalPrice,
        ));
      } catch (e) {
        emit(state.copyWith(
            increaseQuantityState: RequestState.error,
            errorMessage: e.toString()));
      }
    });
    on<DecreaseProduct>((event, emit) async {
      try {
        emit(state.copyWith(decreaseQuantityState: RequestState.loading));
        await HiveCart.decreaseQuantity(event.id);
        emit(state.copyWith(decreaseQuantityState: RequestState.success));
        var updatedTotalPrice = await HiveCart.getTotalPrice();
        var updatedProducts = await HiveCart.getAllProducts();

        emit(state.copyWith(
            decreaseQuantityState: RequestState.success,
            totalPrice: updatedTotalPrice,
            products: updatedProducts));
      } catch (e) {
        emit(state.copyWith(
            decreaseQuantityState: RequestState.error,
            errorMessage: e.toString()));
      }
    });
  }
}
