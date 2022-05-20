// ignore_for_file: must_be_immutable

import 'package:blocdeneme/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/bloc_body.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends MaterialApp {
  MyApp({Key? key})
      : super(
          key: key,
          theme: ThemeData.dark(),
          debugShowCheckedModeBanner: false,
          home: BlocScaffold(),
        );
}

class BlocScaffold extends Scaffold {
  BlocScaffold({Key? key})
      : super(
          key: key,
          appBar: AppBar(
            title: const Text("Bloc Deneme"),
            centerTitle: true,
          ),
          body: BlocProvider(
            create: (context) => CounterBloc(),
            child: BlocBody(),
          ),
        );
}
