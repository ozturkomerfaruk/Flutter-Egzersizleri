import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:blockapideneme/model.dart';
import 'package:equatable/equatable.dart';

import '../service.dart';

part 'result_event.dart';

part 'result_state.dart';

class ResultBloc extends Bloc<ResultEvent, ResultState> {
  Service service = Service();

  ResultBloc() : super(ResultInitialState()) {
    on<InitialResult>((event, emit) => emit(ResultInitialState()));

    on<LoadingResult>((event, emit) async {
      List<Results> results = await service.fetchResult();
      emit(ResultState(result: results));
    });
  }
}
