import 'package:blockapideneme/ResultBloc/result_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OurBody extends StatelessWidget {
  OurBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: BlocBuilder<ResultBloc, ResultState>(
          builder: (context, state) {
            if (state is ResultInitialState) {
              context.read<ResultBloc>().add(LoadingResult());
            }
            return state is ResultInitialState
                ? CircularProgressIndicator()
                : Column(
                    children: state.result
                        .map((e) => Text(e.episode.toString()))
                        .toList(),
                  );
          },
        ),
      ),
    );
  }
}
