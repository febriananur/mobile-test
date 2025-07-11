import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../models/sensor_data_model.dart';

class SensorProvider with ChangeNotifier {
  SensorData _data = SensorData(
    temperature: 28.5,
    humidity: 65.0,
    windSpeed: 5.0,
    windDirection: 90.0,
    rainfall: 0.0,
    solarVoltage: 12.0,
    solarCurrent: 1.0,
  );

  final Random _random = Random();

  SensorData get data => _data;

  SensorProvider() {
    _startSimulation();
  }

  void _startSimulation() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      final temp = 25 + _random.nextDouble() * 10; // 25 - 35 °C
      final hum = 40 + _random.nextDouble() * 40; // 40 - 80 %
      final windSpd = _random.nextDouble() * 20; // 0 - 20 m/s
      final windDir = _random.nextDouble() * 360; // 0 - 360 deg
      final rain = _random.nextDouble() * 10; // 0 - 10 mm
      final solarVolt = 10 + _random.nextDouble() * 3; // 10 - 13 V
      final solarAmp = _random.nextDouble() * 2; // 0 - 2 A
      final battery = 50 + _random.nextDouble() * 50; // 50% - 100%
      final pressure = 1000 + _random.nextDouble() * 30; // 1000 - 1030 hPa

      _data = SensorData(
        temperature: temp,
        humidity: hum,
        windSpeed: windSpd,
        windDirection: windDir,
        rainfall: rain,
        solarVoltage: solarVolt,
        solarCurrent: solarAmp,
        batteryLevel: battery,
        pressure: pressure,
      );

      notifyListeners();
    });
  }
}
