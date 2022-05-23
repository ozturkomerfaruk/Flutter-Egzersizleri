// ignore_for_file: void_checks

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_udemy/data/weather_repo.dart';
import 'package:flutter_udemy/locator.dart';
import 'package:flutter_udemy/model/weather.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepository weatherRepository = locator<WeatherRepository>();

  WeatherBloc() : super(WeatherInitialState()) {
    on<WeatherEvent>((event, emit) async* {
      if (event is FetchWeatherEvent) {
        yield WeatherLoadingState();
        try {
          final Weather? getirilenWeather =
              await weatherRepository.getWeather(event.sehirAdi);
          yield WeatherLoadedState(weather: getirilenWeather!);
        } catch (e) {
          yield WeatherErrorState();
        }
      }
    });
  }
}
