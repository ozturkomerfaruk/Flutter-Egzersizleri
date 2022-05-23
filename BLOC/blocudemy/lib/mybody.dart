import 'dart:async';

import 'package:blocudemy/bloc/b_counter_bloc.dart';
import 'package:blocudemy/cubit/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyBody extends StatelessWidget {
  MyBody({Key? key}) : super(key: key);

  SayacViewModel sayacViewModel = SayacViewModel();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<BCounterBloc, BCounterState>(
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FloatingActionButton(
                onPressed: () =>
                    context.read<BCounterBloc>().add(ArttirCounterEvent()),
                child: const Text("-"),
              ),
              Text(
                state.sayac.toString(),
              ),
              FloatingActionButton(
                onPressed: () =>
                    context.read<BCounterBloc>().add(AzaltCounterEvent()),
                child: const Text("+"),
              )
            ],
          );
        },
      ),
    );
  }
}

class SayacViewModel {
  int _sayac = 550;
  final StreamController<int> _controller = StreamController<int>();
  Stream<int> get myStream => _controller.stream;
  Sink get _sink => _controller.sink;

  int init() => _sayac;

  SayacViewModel() {
    _sink.add(_sayac);
  }

  void azalt() {
    _sink.add(--_sayac);
  }

  void arttir() {
    _sink.add(++_sayac);
  }
}
