part of weather_manager;

/// A class that represents geographical coordinates with latitude and longitude.
class Coordinate {
  /// The latitude value of the coordinate.
  final double latitude;

  /// The longitude value of the coordinate.
  final double longitude;

  /// Creates an instance of [Coordinate] with the given [latitude] and [longitude].
  ///
  /// Both [latitude] and [longitude] are required and must be provided.
  const Coordinate({required this.latitude, required this.longitude});

  /// Returns a string representation of the coordinate.
  ///
  /// The output format is: `Latitude: X.XXXX, Longitude: Y.YYYY`.
  @override
  String toString() => 'Latitude: $latitude, Longitude: $longitude';
}