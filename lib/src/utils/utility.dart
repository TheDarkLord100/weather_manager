part of weather_manager;

class Utils {
  /// Converts a string weather condition to its corresponding [WeatherCondition] enum.
  ///
  /// Throws an [APIException] if the weather condition is invalid.
  static WeatherCondition getCondition(String str) => switch (str) {
    'Thunderstorm' => WeatherCondition.thunderStorm,
    'Drizzle' => WeatherCondition.drizzle,
    'Rain' => WeatherCondition.rain,
    'Snow' => WeatherCondition.snow,
    'Mist' => WeatherCondition.mist,
    'Smoke' => WeatherCondition.smoke,
    'Haze' => WeatherCondition.haze,
    'Dust' => WeatherCondition.dust,
    'Fog' => WeatherCondition.fog,
    'Sand' => WeatherCondition.sand,
    'Ash' => WeatherCondition.ash,
    'Squall' => WeatherCondition.squall,
    'Tornado' => WeatherCondition.tornado,
    'Clear' => WeatherCondition.clear,
    'Clouds' => WeatherCondition.cloud,
    _ => throw APIException('Invalid Weather code')
  };
}