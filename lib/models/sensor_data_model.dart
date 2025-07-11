class SensorData {
  final double temperature;
  final double humidity;
  final double windSpeed;
  final double windDirection;
  final double rainfall;
  final double solarVoltage;
  final double solarCurrent;
  final double batteryLevel;
  final double pressure;

  SensorData({
    required this.temperature,
    required this.humidity,
    this.windSpeed = 0.0,
    this.windDirection = 0.0,
    this.rainfall = 0.0,
    this.solarVoltage = 0.0,
    this.solarCurrent = 0.0,
    this.batteryLevel = 100.0,
    this.pressure = 1013.25,
  });

  SensorData copyWith({
    double? temperature,
    double? humidity,
    double? windSpeed,
    double? windDirection,
    double? rainfall,
    double? solarVoltage,
    double? solarCurrent,
    double? batteryLevel,
    double? pressure,
  }) {
    return SensorData(
      temperature: temperature ?? this.temperature,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
      windDirection: windDirection ?? this.windDirection,
      rainfall: rainfall ?? this.rainfall,
      solarVoltage: solarVoltage ?? this.solarVoltage,
      solarCurrent: solarCurrent ?? this.solarCurrent,
      batteryLevel: batteryLevel ?? this.batteryLevel,
      pressure: pressure ?? this.pressure,
    );
  }
}
