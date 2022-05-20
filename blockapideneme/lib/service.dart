// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:blockapideneme/model.dart';
import 'package:dio/dio.dart';

class Service {
  String url = "https://rickandmortyapi.com/api/episode/";

  var dio = Dio();

  Future<List<Results>> fetchResult() async {
    try {
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        return RickyAndMorty.fromJson(response.data).results!;
      }
      return [];
    } catch (e) {
      print(e);
    }
    return [];
  }
}
