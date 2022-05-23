part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class InitialNumber extends CounterEvent {}

class IncrementNumber extends CounterEvent {}

class DecrementNumber extends CounterEvent {}
