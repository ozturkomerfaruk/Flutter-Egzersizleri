import 'dart:convert';

import 'package:flutter_udemy/model/weather.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  static Future<Weather?> fetchOpenWeather({String sehir = "Ankara"}) async {
    String openWheatherURL =
        "https://api.openweathermap.org/data/2.5/weather?q=Ankara&appid=352d1bd1838b7aa765b22e9d8ec50b41";

    var response = await http.get(
      Uri.parse(openWheatherURL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      return Weather.fromJson(json.decode(utf8.decode(response.bodyBytes)));
    } else {
      return null;
    }
  }
}
