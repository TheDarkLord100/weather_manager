import 'package:weather_manager/weather_manager.dart';

void main() async {
  WeatherMan weatherMan =
      WeatherMan(apiKey: 'ef0f78f151c685f37bc843a251e79a10');

  //Get hourly weather forecast for 5 days every 3 hours
  final hourlyWeatherForecast =
      await weatherMan.getHourlyForecast(lat: 26.9287, long: 80.9335);

  //Get current weather forecast
  final currentWeather =
      await weatherMan.getCurrentWeatherByLatLong(lat: 26.9287, long: 80.9335);


}
