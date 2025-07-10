import 'package:flutter/material.dart';
import '../models/sensor_data_model.dart';

class SensorProvider with ChangeNotifier {
  SensorData _data = SensorData(temperature: 28.5, humidity: 65.0);

  SensorData get data => _data;

  void update(double temp, double hum) {
    _data = SensorData(temperature: temp, humidity: hum);
    notifyListeners();
  }
}
