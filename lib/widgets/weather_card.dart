import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/weather_provider.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(BuildContext context) {
    final weather = Provider.of<WeatherProvider>(context).data;

    if (weather == null) {
      return const Card(
        child: ListTile(
          title: Text("Loading weather..."),
          subtitle: Text("Please wait"),
        ),
      );
    }

    return Card(
      child: ListTile(
        leading: Image.network(weather.iconUrl),
        title: Text(weather.condition),
        subtitle: Text("${weather.temperature.toStringAsFixed(1)} °C"),
      ),
    );
  }
}
