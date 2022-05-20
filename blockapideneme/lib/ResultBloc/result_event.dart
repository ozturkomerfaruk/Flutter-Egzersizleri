part of 'result_bloc.dart';

abstract class ResultEvent extends Equatable {
  const ResultEvent();

  @override
  List<Object> get props => [];
}

class LoadingResult extends ResultEvent {}

class InitialResult extends ResultEvent {}

