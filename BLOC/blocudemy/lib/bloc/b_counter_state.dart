part of 'b_counter_bloc.dart';

@immutable
abstract class BCounterState {
  final int sayac;

  const BCounterState({
    required this.sayac,
  });
}

class BCounterInitial extends BCounterState {
  const BCounterInitial({required int baslangicDegeri})
      : super(sayac: baslangicDegeri);
}

class MyCounterState extends BCounterState {
  const MyCounterState({required int sayacDegeri}) : super(sayac: sayacDegeri);
}
