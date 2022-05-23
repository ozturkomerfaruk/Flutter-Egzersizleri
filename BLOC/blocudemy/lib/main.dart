import 'package:blocudemy/bloc/b_counter_bloc.dart';
import 'package:blocudemy/cubit/counter_cubit.dart';
import 'package:blocudemy/mybody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends MaterialApp {
  MyApp({Key? key})
      : super(
          key: key,
          theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: MyScaffold(),
        );
}

class MyScaffold extends Scaffold {
  MyScaffold({Key? key})
      : super(
          key: key,
          appBar: AppBar(
            title: const Text("Bloc Udemy"),
            centerTitle: true,
          ),
          body: BlocProvider(
            create: (context) => BCounterBloc(),
            child: MyBody(),
          ),
        );
}
