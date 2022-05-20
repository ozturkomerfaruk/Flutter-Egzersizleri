import 'package:blockapideneme/ResultBloc/result_bloc.dart';
import 'package:blockapideneme/ourbody.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(App());
}

class App extends MaterialApp {
  App({Key? key})
      : super(
    key: key,
    debugShowCheckedModeBanner: false,
    theme: ThemeData.dark(),
    home: OurScaffold(),
  );
}

class OurScaffold extends Scaffold {
  OurScaffold({Key? key})
      : super(
      key: key,
      appBar: AppBar(
        title: const Text("Bloc API Deneme with DIO"),
        centerTitle: true,
      ),
      body: BlocProvider(
        create: (context) => ResultBloc(),
        child: OurBody(),
      ),);
}
