import 'package:flutter_test/flutter_test.dart';

import 'package:weather_manager/weather_manager.dart';

void main() {
  test('current weather', () async {
    WeatherMan weatherMan =
        WeatherMan(apiKey: 'ef0f78f151c685f37bc843a251e79a10');

    final res = await weatherMan.getCurrentWeatherByLatLong(lat: 26.9287, long: 80.9335);

  });

  test('forecast weather', () async {
    WeatherMan weatherMan =
    WeatherMan(apiKey: 'ef0f78f151c685f37bc843a251e79a10');

    final res = await weatherMan.getHourlyForecast(lat: 26.9287, long: 80.9335);
  });
}
