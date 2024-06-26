part of weather_manager;

/// A class to fetch the current weather data from the OpenWeather API.
class CurrentWeather {
  /// The HTTP client used to make API requests.
  late http.Client client;

  /// The API key for accessing the OpenWeather API.
  final String apiKey;

  /// Creates an instance of [CurrentWeather] with the provided HTTP client and API key.
  ///
  /// - [client]: The HTTP client used for making network requests.
  /// - [apiKey]: The API key for authenticating requests to the OpenWeather API.
  CurrentWeather(this.client, this.apiKey);

  /// Fetches the current weather data for a given latitude and longitude.
  ///
  /// - [lat]: The latitude coordinate for the location.
  /// - [long]: The longitude coordinate for the location.
  ///
  /// Returns a [CurrentWeatherResponse] containing the weather data if the request is successful.
  /// Throws an [APIException] if the request fails.
  Future<CurrentWeatherResponse> currentWeatherByLatLong({
    required double lat,
    required double long,
  }) async {
    final url = 'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey';
    final uri = Uri.parse(url);

    final http.Response response = await http.get(uri);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return CurrentWeatherResponse.fromMap(data);
    } else {
      throw APIException(response.body);
    }
  }

  /// Fetches the hourly weather forecast data for a given latitude and longitude.
  ///
  /// - [lat]: The latitude coordinate for the location.
  /// - [long]: The longitude coordinate for the location.
  ///
  /// Returns a [ForecastWeatherResponse] containing the forecast data if the request is successful.
  /// Throws an [APIException] if the request fails.
  Future<ForecastWeatherResponse> hourlyWeatherForecast({
    required double lat,
    required double long,
  }) async {
    final url = 'https://api.openweathermap.org/data/2.5/forecast?lat=${lat}&lon=${long}&appid=${apiKey}';
    final uri = Uri.parse(url);

    final http.Response response = await http.get(uri);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return ForecastWeatherResponse.fromMap(data);
    } else {
      throw APIException(response.body);
    }
  }
}