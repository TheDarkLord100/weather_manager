import 'package:weather_manager/weather_manager.dart';

void main() async {
  // Create an instance of WeatherMan with your API key
  WeatherMan weatherMan = WeatherMan(apiKey: 'YOUR_API_KEY');

  try {
    // Get hourly weather forecast for 5 days every 3 hours
    final hourlyWeatherForecast = await weatherMan.getHourlyForecast(
      lat: 26.9287,
      long: 80.9335,
    );

    // Print hourly weather forecast details
    print('Hourly Weather Forecast for 5 days:');
    print(
        'City: ${hourlyWeatherForecast.cityName}, ${hourlyWeatherForecast.countryCode}');
    print('Coordinates: ${hourlyWeatherForecast.coordinates}');
    print('Timezone Offset: ${hourlyWeatherForecast.timezoneOffset}');
    print('Sunrise: ${hourlyWeatherForecast.sunrise}');
    print('Sunset: ${hourlyWeatherForecast.sunset}');
    print('Data Count: ${hourlyWeatherForecast.dataCount}');
    for (var weatherData in hourlyWeatherForecast.weatherData) {
      print('DateTime: ${weatherData.currentTime}');
      print('Temperature: ${weatherData.temperature}');
      print('Feels Like: ${weatherData.feelsLike}');
      print('Minimum Temperature: ${weatherData.minimumTemperature}');
      print('Maximum Temperature: ${weatherData.maximumTemperature}');
      print('Humidity: ${weatherData.humidity}');
      print('Weather Condition: ${weatherData.weatherCondition}');
      print('Weather: ${weatherData.weatherDescription}');
      print('Wind Speed: ${weatherData.windSpeed}');
      print('Cloud Cover: ${weatherData.cloudCover}');
      print('Visibility: ${weatherData.visibility}');
      print('-----------------------------------');
    }

    // Get current weather forecast
    final currentWeather = await weatherMan.getCurrentWeatherByLatLong(
      lat: 26.9287,
      long: 80.9335,
    );

    // Print current weather details
    print('Current Weather:');
    print('City: ${currentWeather.cityName}, ${currentWeather.countryCode}');
    print('Coordinates: ${currentWeather.coordinates}');
    print('Temperature: ${currentWeather.weatherData.temperature}');
    print('Feels Like: ${currentWeather.weatherData.feelsLike}');
    print(
        'Minimum Temperature: ${currentWeather.weatherData.minimumTemperature}');
    print(
        'Maximum Temperature: ${currentWeather.weatherData.maximumTemperature}');
    print('Humidity: ${currentWeather.weatherData.humidity}');
    print('Weather: ${currentWeather.weatherData.weatherDescription}');
    print('Wind Speed: ${currentWeather.weatherData.windSpeed}');
    print('Cloud Cover: ${currentWeather.weatherData.cloudCover}');
    print('Visibility: ${currentWeather.weatherData.visibility}');
    print('Sunrise: ${currentWeather.sunrise}');
    print('Sunset: ${currentWeather.sunset}');
    print('Timezone Offset: ${currentWeather.timezoneOffset}');
  } catch (e) {
    print('Error: $e');
  }
}
