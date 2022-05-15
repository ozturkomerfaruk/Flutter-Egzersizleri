import 'package:denemelerdunyasi/news_data.dart';
import 'package:denemelerdunyasi/stories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider<NewsData>(
        create: (context) => NewsData(),
        builder: (context, child) => const StoriesPage(),
      ),
    );
  }
}

//https://www.youtube.com/watch?v=CQt91j_MsUw&ab_channel=JohanJurrius