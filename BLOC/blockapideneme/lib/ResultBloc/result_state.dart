part of 'result_bloc.dart';

class ResultState extends Equatable {
  ResultState({required this.result});
  List<Results> result;

  @override
  List<Object> get props => [result];
}

class ResultInitialState extends ResultState {
  ResultInitialState() : super(result: []);
}
