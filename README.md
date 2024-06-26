# Weather Manager Package

A Dart package for fetching current and forecasted weather data using the OpenWeather API.

## Features

- Retrieve current weather data by latitude and longitude.
- Retrieve hourly weather forecast for up to 5 days.

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  weather_manager: ^1.0.0
```

Then, run `flutter pub get` to install the package.

## Usage

### Import the package

```dart
import 'package:weather_manager/weather_manager.dart';
```

### Initialize WeatherMan

Create an instance of `WeatherMan` with your OpenWeather API key:

```dart
void main() async {
  WeatherMan weatherMan = WeatherMan(apiKey: 'your_api_key_here');

  // Get hourly weather forecast for 5 days every 3 hours
  final hourlyWeatherForecast = await weatherMan.getHourlyForecast(lat: 26.9287, long: 80.9335);

  // Get current weather forecast
  final currentWeather = await weatherMan.getCurrentWeatherByLatLong(lat: 26.9287, long: 80.9335);

  print(hourlyWeatherForecast);
  print(currentWeather);
}
```

### Example

Below is a complete example demonstrating how to use the `WeatherMan` class to fetch weather data:

```dart
import 'package:weather_manager/weather_manager.dart';

void main() async {
  WeatherMan weatherMan = WeatherMan(apiKey: 'your_api_key_here');

  // Get hourly weather forecast for 5 days every 3 hours
  final hourlyWeatherForecast = await weatherMan.getHourlyForecast(lat: 26.9287, long: 80.9335);

  // Get current weather forecast
  final currentWeather = await weatherMan.getCurrentWeatherByLatLong(lat: 26.9287, long: 80.9335);

  print(hourlyWeatherForecast);
  print(currentWeather);
}
```

### CurrentWeatherResponse

Represents the current weather data response. Includes information such as:

- Geographical coordinates
- Weather condition
- Temperature
- Humidity
- Wind speed
- Cloud cover
- Visibility
- Sunrise and sunset times
- City name and country code

### ForecastWeatherResponse

Represents the forecasted weather data response. Includes information such as:

- Geographical coordinates
- Number of data points
- Weather data for each point
- Sunrise and sunset times
- City name and country code
- Timezone offset

## License

This package is licensed under the MIT License. See the [LICENSE](LICENSE) file for more information.