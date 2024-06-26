part of weather_manager;

/// A custom exception class for handling API errors.
class APIException implements Exception {
  /// The error message describing the API issue.
  final String message;

  /// Creates an instance of [APIException] with the given [message].
  APIException(this.message);

  /// Returns a string representation of the API exception.
  @override
  String toString() => 'APIException: $message';
}
