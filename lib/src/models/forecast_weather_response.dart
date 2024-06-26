part of weather_manager;

/// A class representing the forecast weather response from the weather API.
class ForecastWeatherResponse {
  /// The geographical coordinates of the location.
  final Coordinate coordinates;

  /// The number of data points in the weather data list.
  final int dataCount;

  /// A list of weather data points.
  final List<WeatherData> weatherData;

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

  /// Constructs a [ForecastWeatherResponse] instance.
  ///
  /// Takes in [coordinates], [dataCount], [weatherData], [sunrise],
  /// [sunset], [cityName], [countryCode], and [timezoneOffset].
  ForecastWeatherResponse({
    required this.coordinates,
    required this.dataCount,
    required this.weatherData,
    required this.sunrise,
    required this.sunset,
    required this.cityName,
    required this.countryCode,
    required this.timezoneOffset,
  });

  /// Creates a [ForecastWeatherResponse] instance from a [map].
  ///
  /// The [map] parameter should be a decoded JSON map containing
  /// the weather API response data.
  factory ForecastWeatherResponse.fromMap(Map<String, dynamic> map) {
    final city = map['city'];
    final List weatherList = map['list'];
    Duration timeZoneOffset = Duration(seconds: city['timezone']);
    List<WeatherData> list = [];
    for (final weather in weatherList) {
      list.add(WeatherData.fromMap(weather as Map<String, dynamic>, timeZoneOffset));
    }
    return ForecastWeatherResponse(
      coordinates: Coordinate(
        latitude: city['coord']['lat'],
        longitude: city['coord']['lon'],
      ),
      dataCount: map['cnt'],
      weatherData: list,
      sunrise: DateTime.fromMillisecondsSinceEpoch(city['sunrise'] * 1000, isUtc: true)
          .add(timeZoneOffset),
      sunset: DateTime.fromMillisecondsSinceEpoch(city['sunset'] * 1000, isUtc: true)
          .add(timeZoneOffset),
      cityName: city['name'],
      countryCode: city['country'],
      timezoneOffset: timeZoneOffset,
    );
  }


  /// Returns a string implementation of [ForecastWeatherResponse]
  ///
  /// The [toString] method provides a human-readable representation of the
  /// [ForecastWeatherResponse] object, which includes the coordinates,
  /// weather data, sunrise and sunset times, city and country name,
  /// timezone offset, and data source.
  @override
  String toString() {
    return 'ForecastWeatherResponse {'
        'coordinates: $coordinates, '
        'dataCount: $dataCount, '
        'weatherData: $weatherData, '
        'sunrise: $sunrise, '
        'sunset: $sunset, '
        'cityName: $cityName, '
        'countryCode: $countryCode, '
        'timezoneOffset: $timezoneOffset '
        '}';
  }
}
