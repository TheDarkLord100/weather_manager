part of weather_manager;

/// A class that represents temperature in Kelvin and provides conversions to Celsius and Fahrenheit.
class Temperature {
  /// The temperature value in Kelvin.
  final double _kelvin;

  /// Creates an instance of [Temperature] with the given temperature value in Kelvin.
  Temperature(this._kelvin);

  /// Returns the temperature in Kelvin.
  double get kelvin => _kelvin;

  /// Returns the temperature in Celsius.
  ///
  /// The conversion formula used is: `Celsius = Kelvin - 273.15`.
  double get celsius => _kelvin - 273.15;

  /// Returns the temperature in Fahrenheit.
  ///
  /// The conversion formula used is: `Fahrenheit = Kelvin * (9 / 5) - 459.67`.
  double get fahrenheit => _kelvin * (9 / 5) - 459.67;

  /// Returns a string representation of the temperature in Kelvin, Celsius, and Fahrenheit.
  ///
  /// The output format is: `Temperature: X.XX K, Y.YY °C, Z.ZZ °F`.
  @override
  String toString() {
    return 'Temperature: ${_kelvin.toStringAsFixed(2)} K, '
        '${celsius.toStringAsFixed(2)} °C, '
        '${fahrenheit.toStringAsFixed(2)} °F';
  }
}