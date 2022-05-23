import 'package:flutter/material.dart';
import 'package:flutter_udemy/mybody.dart';

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
          appBar: AppBar(),
          body: MyBody(),
        );
}
