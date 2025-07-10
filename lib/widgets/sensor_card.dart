import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sensor_provider.dart'; // pastikan ada provider untuk sensor

class SensorCard extends StatelessWidget {
  const SensorCard({super.key});

  @override
  Widget build(BuildContext context) {
    final sensorData = Provider.of<SensorProvider>(context).data;

    final temperature = sensorData?.temperature ?? 0;
    final humidity = sensorData?.humidity ?? 0;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              "Sensor Monitoring",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildSensorTile(
                  icon: Icons.thermostat,
                  label: "Suhu",
                  value: "${temperature.toStringAsFixed(1)} °C",
                  color: Colors.orange,
                ),
                _buildSensorTile(
                  icon: Icons.water_drop,
                  label: "Kelembaban",
                  value: "${humidity.toStringAsFixed(1)} %",
                  color: Colors.blue,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSensorTile({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Column(
      children: [
        CircleAvatar(
          radius: 26,
          backgroundColor: color.withOpacity(0.2),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
        Text(
          value,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
