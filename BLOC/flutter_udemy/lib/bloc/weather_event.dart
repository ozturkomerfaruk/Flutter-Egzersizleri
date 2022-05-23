part of 'weather_bloc.dart';

abstract class WeatherEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchWeatherEvent extends WeatherEvent {
  final String sehirAdi;

  FetchWeatherEvent({
    required this.sehirAdi,
  }) : super();
}
