// ignore_for_file: must_be_immutable

import 'package:blocdeneme/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBody extends StatelessWidget {
  BlocBody({Key? key}) : super(key: key);

  TextStyle textStyle = const TextStyle(fontSize: 24);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(DecrementNumber()),
            child: Text(
              "-",
              style: textStyle,
            ),
          ),
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state) {
              return Text(
                state.number.toString(),
                style: textStyle,
              );
            },
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(IncrementNumber()),
            child: Text(
              "+",
              style: textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
