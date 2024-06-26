part of weather_manager;

/// A class that represents detailed weather data.
class WeatherData {
  /// The current weather condition.
  final WeatherCondition weatherCondition;

  /// A description of the current weather condition.
  final String weatherDescription;

  /// URL of the icon representing the weather condition during the day.
  final String iconDayUrl;

  /// URL of the icon representing the weather condition during the night.
  final String iconNightUrl;

  /// The current temperature.
  final Temperature temperature;

  /// The "feels like" temperature.
  final Temperature feelsLike;

  /// The minimum temperature recorded.
  final Temperature minimumTemperature;

  /// The maximum temperature recorded.
  final Temperature maximumTemperature;

  /// The humidity percentage.
  final int humidity;

  /// The sea level atmospheric pressure.
  final double seaLevelPressure;

  /// The ground level atmospheric pressure.
  final double groundLevelPressure;

  /// The visibility distance in meters.
  final int visibility;

  /// The wind speed in meters/second.
  final double windSpeed;

  /// The wind direction in degrees.
  final double windDirection;

  /// The wind gust speed in meters/second, if available.
  final double? windGust;

  /// The cloud cover percentage.
  final double cloudCover;

  /// The rain volume for the last 1 hour in mm, if available.
  final double? rainOneHour;

  /// The rain volume for the last 3 hours in mm, if available.
  final double? rainThreeHour;

  /// The snow volume for the last 1 hour in mm, if available.
  final double? snowOneHour;

  /// The snow volume for the last 3 hours in mm, if available.
  final double? snowThreeHour;

  /// The current time at the location.
  final DateTime currentTime;

  /// The probability of precipitation, if available.
  final double? pop;

  /// Creates an instance of [WeatherData].
  WeatherData(
      {required this.weatherCondition,
      required this.weatherDescription,
      required this.iconDayUrl,
      required this.iconNightUrl,
      required this.temperature,
      required this.feelsLike,
      required this.minimumTemperature,
      required this.maximumTemperature,
      required this.humidity,
      required this.seaLevelPressure,
      required this.groundLevelPressure,
      required this.visibility,
      required this.windSpeed,
      required this.windDirection,
      this.windGust,
      required this.cloudCover,
      this.rainOneHour,
      this.rainThreeHour,
      this.snowOneHour,
      this.snowThreeHour,
      required this.currentTime,
      this.pop});

  /// Creates an instance of [WeatherData] from a map containing the response data.
  factory WeatherData.fromMap(
      Map<String, dynamic> map, Duration timeZoneOffset) {
    final weather = map['weather'][0];
    String urlCode = weather['icon'].substring(0, 2);
    final main = map['main'];
    return WeatherData(
        weatherCondition: Utils.getCondition(weather['main']),
        weatherDescription: weather['description'],
        iconDayUrl: 'https://openweathermap.org/img/wn/${urlCode}d@2x.png',
        iconNightUrl: 'https://openweathermap.org/img/wn/${urlCode}n@2x.png',
        temperature: Temperature(main['temp'].toDouble()),
        feelsLike: Temperature(main['feels_like'].toDouble()),
        minimumTemperature: Temperature(main['temp_min'].toDouble()),
        maximumTemperature: Temperature(main['temp_max'].toDouble()),
        humidity: main['humidity'],
        seaLevelPressure: main['pressure']?.toDouble() ?? 0.0,
        groundLevelPressure: main['grnd_level']?.toDouble() ?? 0.0,
        visibility: map['visibility'],
        windSpeed: map['wind']['speed']?.toDouble() ?? 0.0,
        windDirection: map['wind']['deg']?.toDouble() ?? 0.0,
        windGust: map['wind']['gust']?.toDouble(),
        cloudCover: map['clouds']['all']?.toDouble() ?? 0.0,
        rainOneHour:
            map.containsKey('rain') ? map['rain']['1h']?.toDouble() : null,
        rainThreeHour:
            map.containsKey('rain') ? map['rain']['3h']?.toDouble() : null,
        snowOneHour:
            map.containsKey('snow') ? map['snow']['1h']?.toDouble() : null,
        snowThreeHour:
            map.containsKey('snow') ? map['snow']['3h']?.toDouble() : null,
        currentTime:
            DateTime.fromMillisecondsSinceEpoch(map['dt'] * 1000, isUtc: true)
                .add(timeZoneOffset),
        pop: map['pop']?.toDouble() ?? null);
  }

  /// Returns a string representation of the weather data.
  @override
  String toString() {
    return 'WeatherData'
        '  weatherCondition: $weatherCondition'
        '  weatherDescription: $weatherDescription'
        '  iconDayUrl: $iconDayUrl'
        '  iconNightUrl: $iconNightUrl'
        '  temperature: $temperature'
        '  feelsLike: $feelsLike'
        '  minimumTemperature: $minimumTemperature'
        '  maximumTemperature: $maximumTemperature'
        '  humidity: $humidity'
        '  seaLevelPressure: $seaLevelPressure'
        '  groundLevelPressure: $groundLevelPressure'
        '  visibility: $visibility'
        '  windSpeed: $windSpeed'
        '  windDirection: $windDirection'
        '  windGust: $windGust'
        '  cloudCover: $cloudCover'
        '  rainOneHour: $rainOneHour'
        '  rainThreeHour: $rainThreeHour'
        '  snowOneHour: $snowOneHour'
        '  snowThreeHour: $snowThreeHour'
        '  currentTime: $currentTime'
        '  pop: $pop,'
        '}';
  }
}
