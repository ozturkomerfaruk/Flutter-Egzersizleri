import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const InitialCounterState()) {
    on<InitialNumber>(_onInitialNumber);
    on<IncrementNumber>(_onIncrementNumber);
    on<DecrementNumber>(_onDecrementNumber);
  }

  void _onInitialNumber(event, emit) => emit(const InitialCounterState());

  void _onIncrementNumber(IncrementNumber event, emit) =>
      emit(state.copyWith(number: state.number + 1));

  void _onDecrementNumber(DecrementNumber event, emit) =>
      emit(state.copyWith(number: state.number - 1));
}
