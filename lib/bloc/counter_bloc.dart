import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<int> {
  CounterCubit({this.initialValue = 0}) : super(initialValue);

  int initialValue;

  void increment() => emit(state + 1);

  void decrement() => emit(state - 1);

  // bloc observer
  @override
  void onChange(Change<int> change) {
    print(change);
    super.onChange(change);
  }
}
