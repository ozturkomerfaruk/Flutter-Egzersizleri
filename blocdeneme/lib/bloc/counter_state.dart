part of 'counter_bloc.dart';

class CounterState extends Equatable {
  const CounterState({required this.number});
  final int number;

  CounterState copyWith({required int number}) => CounterState(number: number);

  @override
  List<Object> get props => [number];
}

class InitialCounterState extends CounterState {
  const InitialCounterState() : super(number: 0);
}
