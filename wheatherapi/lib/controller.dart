import 'package:get/get.dart';
import 'package:wheatherapi/model.dart';
import 'package:wheatherapi/service.dart';

class OpenWeatherController extends GetxController {
  var isLoading = false.obs;
  var openWeather = OpenWeather().obs;

  // @override
  // onInit() {
  //   fetchOpenWeather();
  //   super.onInit();
  // }

  Future<void> fetchOpenWeather(String cityName) async {
    try {
      isLoading(true);
      openWeather.value =
          (await OpenWeatherService.fetchOpenWeather(sehir: cityName))!;
    } finally {
      isLoading(false);
    }
  }
}
