import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('📤 Event: ${bloc.runtimeType} => $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('🔄 State Change in ${bloc.runtimeType}: $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('❌ Error in ${bloc.runtimeType}: $error');
    super.onError(bloc, error, stackTrace);
  }
}
