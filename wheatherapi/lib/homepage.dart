import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wheatherapi/controller.dart';

OpenWeatherController openWeatherController = Get.put(OpenWeatherController());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Text('Loading...');
              default:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  return WeatherDesign();
                }
            }
          },
          future: openWeatherController.fetchOpenWeather("Moscow"),
        ),
      ),
    );
  }
}

class WeatherDesign extends StatelessWidget {
  WeatherDesign({Key? key}) : super(key: key);

  double temp = openWeatherController.openWeather.value.main!.temp! - 273;
  String city = openWeatherController.openWeather.value.name!;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        height: 300,
        width: 200,
        color: Colors.red.shade400,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text("Sicaklik: " + temp.toString()),
            ),
            Center(
              child: Text("Şehir: " + city),
            ),
          ],
        ),
      ),
    );
  }
}
