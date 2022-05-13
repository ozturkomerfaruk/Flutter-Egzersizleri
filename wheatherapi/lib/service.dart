// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:wheatherapi/model.dart';

import 'package:http/http.dart' as http;

class OpenWeatherService {
  static Encoding? encoding = Encoding.getByName('utf-8');

  static Future<OpenWeather?> fetchOpenWeather(
      {String sehir = "Ankara"}) async {
    String openWheatherURL =
        "https://api.openweathermap.org/data/2.5/weather?q=" +
            sehir +
            "&appid=352d1bd1838b7aa765b22e9d8ec50b41";

    var response = await http.get(
      Uri.parse(openWheatherURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    print(response.statusCode);
    if (response.statusCode >= 200 && response.statusCode < 300) {
      return OpenWeather.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      return null;
    }
  }
}
