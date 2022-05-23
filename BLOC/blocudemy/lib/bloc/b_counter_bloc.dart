import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'b_counter_event.dart';
part 'b_counter_state.dart';

class BCounterBloc extends Bloc<BCounterEvent, BCounterState> {
  BCounterBloc() : super(const BCounterInitial(baslangicDegeri: 60)) {
    on<ArttirCounterEvent>((event, emit) {
      emit(MyCounterState(sayacDegeri: state.sayac + 1));
    });
    on<AzaltCounterEvent>((event, emit) {
      emit(MyCounterState(sayacDegeri: state.sayac - 1));
    });
  }
}
