import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit()
      : super(const CounterInitial(
          baslangicDegeri: 20,
        ));

  void arttir() {
    emit(MyCounterState(sayacDegeri: state.sayac + 1));
  }

  void azalt() {
    emit(MyCounterState(sayacDegeri: state.sayac - 1));
  }
}
