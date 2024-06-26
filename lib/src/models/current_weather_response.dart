part of weather_manager;

/// A class that represents the weather response from the OpenWeather API.
class CurrentWeatherResponse {
  /// The geographical coordinates of the location.
  final Coordinate coordinates;

  final WeatherData weatherData;

  /// The time of sunrise at the location.
  final DateTime sunrise;

  /// The time of sunset at the location.
  final DateTime sunset;

  /// The name of the city.
  final String cityName;

  /// The country code of the location.
  final String countryCode;

  /// The timezone offset from UTC in seconds.
  final Duration timezoneOffset;

  /// The data source for the weather information.
  final String dataSource;

  /// Creates an instance of [CurrentWeatherResponse] from a map containing the response data.
  factory CurrentWeatherResponse.fromMap(Map<String, dynamic> map) {
    return CurrentWeatherResponse(
      coordinates: Coordinate(
          latitude: map['coord']['lat'], longitude: map['coord']['lon']),
      sunrise: DateTime.fromMillisecondsSinceEpoch(map['sys']['sunrise'] * 1000,
              isUtc: true)
          .add(Duration(seconds: map['timezone'])),
      sunset: DateTime.fromMillisecondsSinceEpoch(map['sys']['sunset'] * 1000,
              isUtc: true)
          .add(Duration(seconds: map['timezone'])),
      cityName: map['name'],
      countryCode: map['sys']['country'],
      timezoneOffset: Duration(seconds: map['timezone']),
      dataSource: map['base'],
      weatherData: WeatherData.fromMap(map, Duration(seconds: map['timezone'])),
    );
  }

  /// Creates an instance of [CurrentWeatherResponse] with the given parameters.
  CurrentWeatherResponse(
      {required this.coordinates,
      required this.weatherData,
      required this.sunrise,
      required this.sunset,
      required this.cityName,
      required this.countryCode,
      required this.timezoneOffset,
      required this.dataSource});

  /// Returns a string representation of the weather response.
  @override
  String toString() {
    return 'WeatherResponse{coordinates: $coordinates, '
        'weatherData: $weatherData'
        'sunrise: $sunrise, '
        'sunset: $sunset, cityName: $cityName, countryCode: $countryCode, '
        'timezoneOffset: $timezoneOffset, dataSource: $dataSource}';
  }
}
