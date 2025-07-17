import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:responsive_adaptive_ui/core/enum/enum.dart';
import 'package:responsive_adaptive_ui/features/checkout/data/model/make_order_model.dart';
import 'package:responsive_adaptive_ui/features/checkout/data/use_case/make_order_use_case.dart';

part 'checkout_bloc.freezed.dart';
part 'checkout_event.dart';
part 'checkout_state.dart';

@injectable
class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  MakeOrderUseCase makeOrderUseCase;
  CheckoutBloc(this.makeOrderUseCase) : super(const CheckoutState.initial()) {
    on<MakeOrder>((event, emit) async {
      try {
        emit(state.copyWith(
          makeOrderState: RequestState.loading,
        ));
        await makeOrderUseCase.call(event.orders);
        emit(state.copyWith(
          makeOrderState: RequestState.success,
        ));
      } catch (e) {
        emit(state.copyWith(
            makeOrderState: RequestState.error, errorMessage: e.toString()));
      }
    });
  }
}
