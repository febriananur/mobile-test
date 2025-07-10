import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/weather_model.dart';

class WeatherProvider with ChangeNotifier {
  WeatherData? _data;

  WeatherData? get data => _data;

  Future<void> fetchWeatherByLocation(double lat, double lon) async {
    const apiKey = '6f6b75be61c0a4e07f0dcd23777f454e'; // Ganti ini!
    final url = Uri.parse(
      'https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=$apiKey',
    );

    try {
      final response = await http.get(url);
      print("Lat: $lat, Lon: $lon");
      print("Request URL: $url");
      print("Status Code: ${response.statusCode}");
      print("Response Body: ${response.body}");

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);

        final String condition = json['weather'][0]['main'];
        final double temperature = json['main']['temp'].toDouble();
        final String icon = json['weather'][0]['icon'];
        final String iconUrl = 'https://openweathermap.org/img/wn/$icon@2x.png';

        _data = WeatherData(
          condition: condition,
          temperature: temperature,
          iconUrl: iconUrl,
        );
        notifyListeners();
      } else {
        throw Exception('Failed to load weather');
      }
    } catch (e) {
      debugPrint("Error fetching weather: $e");
    }
  }
}
