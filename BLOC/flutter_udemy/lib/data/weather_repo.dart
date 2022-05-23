import 'package:flutter_udemy/data/weather_api.dart';
import 'package:flutter_udemy/locator.dart';
import 'package:flutter_udemy/model/weather.dart';

class WeatherRepository {
  WeatherApiClient weatherApiClient = locator<WeatherApiClient>();

  Future<Weather?> getWeather(String sehir) async {
    
  }
}
