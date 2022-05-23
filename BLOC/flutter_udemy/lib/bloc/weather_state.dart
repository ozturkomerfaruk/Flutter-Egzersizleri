part of 'weather_bloc.dart';

abstract class WeatherState extends Equatable {
  @override
  List<Object> get props => [props];
}

class WeatherInitialState extends WeatherState {
  WeatherInitialState();
}

class WeatherLoadingState extends WeatherState {
  WeatherLoadingState();
}

class WeatherLoadedState extends WeatherState {
  final Weather weather;

  WeatherLoadedState({
    required this.weather,
  }) : super();
}

class WeatherErrorState extends WeatherState {
  WeatherErrorState();
}
