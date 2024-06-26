part of weather_manager;

class APIException implements Exception {
  final String message;

  APIException(this.message);

  @override
  String toString() => 'APIException: $message';
}