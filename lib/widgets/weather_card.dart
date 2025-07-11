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
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.network(weather.iconUrl, width: 32, height: 32),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  weather.condition,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text("${weather.temperature.toStringAsFixed(1)} °C"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
