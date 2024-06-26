part of weather_manager;

/// A class that manages weather-related operations by utilizing the OpenWeatherAPI.
class WeatherMan {
  /// The API key used for authenticating requests to the OpenWeatherAPI.
  final String apiKey;

  /// The HTTP client used for making network requests.
  late http.Client _client;

  /// An instance of [CurrentWeather] to handle current weather data fetching.
  late final CurrentWeather _cw;

  /// Creates an instance of [WeatherMan] with the provided [apiKey].
  ///
  /// Initializes the HTTP client for making requests and sets up the
  /// [CurrentWeather] instance.
  ///
  /// - [apiKey]: The API key for the OpenWeatherAPI.
  WeatherMan({required this.apiKey}) {
    _client = http.Client();
    _cw = CurrentWeather(_client, apiKey);
  }

  /// Retrieves the current weather for the specified latitude and longitude.
  ///
  /// This method makes a network request to the OpenWeatherAPI to fetch
  /// the current weather data for the specified [lat] and [long] coordinates.
  /// It returns a [CurrentWeatherResponse] object containing the parsed weather data.
  ///
  /// Throws an [APIException] if the request fails or the API returns an error.
  ///
  /// - [lat]: The latitude coordinate for the location.
  /// - [long]: The longitude coordinate for the location.
  ///
  /// Returns a [CurrentWeatherResponse] with the current weather data.
  Future<CurrentWeatherResponse> getCurrentWeatherByLatLong({
    required double lat,
    required double long,
  }) async {
    return await _cw.currentWeatherByLatLong(lat: lat, long: long);
  }

  /// Retrieves the hourly weather forecast for the specified latitude and longitude.
  ///
  /// This method makes a network request to the OpenWeatherAPI to fetch
  /// the hourly weather forecast data for the specified [lat] and [long] coordinates.
  /// It returns a [ForecastWeatherResponse] object containing the parsed weather forecast data.
  ///
  /// Throws an [APIException] if the request fails or the API returns an error.
  ///
  /// - [lat]: The latitude coordinate for the location.
  /// - [long]: The longitude coordinate for the location.
  ///
  /// Returns a [ForecastWeatherResponse] with the hourly weather forecast data.
  Future<ForecastWeatherResponse> getHourlyForecast({
    required double lat,
    required double long,
  }) async {
    return await _cw.hourlyWeatherForecast(lat: lat, long: long);
  }
}
