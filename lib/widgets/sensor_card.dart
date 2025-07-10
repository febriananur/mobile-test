import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sensor_provider.dart';

class SensorCard extends StatelessWidget {
  const SensorCard({super.key});

  @override
  Widget build(BuildContext context) {
    final sensor = Provider.of<SensorProvider>(context).data;

    return Card(
      child: ListTile(
        title: Text("Sensor"),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Temperature: ${sensor.temperature.toStringAsFixed(1)} °C"),
            Text("Humidity: ${sensor.humidity.toStringAsFixed(1)} %"),
          ],
        ),
      ),
    );
  }
}
