import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sensor_provider.dart';

class WindRainCard extends StatelessWidget {
  const WindRainCard({super.key});

  String _getWindDirectionLabel(double deg) {
    if (deg >= 337.5 || deg < 22.5) return 'N';
    if (deg < 67.5) return 'NE';
    if (deg < 112.5) return 'E';
    if (deg < 157.5) return 'SE';
    if (deg < 202.5) return 'S';
    if (deg < 247.5) return 'SW';
    if (deg < 292.5) return 'W';
    return 'NW';
  }

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SensorProvider>(context).data;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Angin & Curah Hujan",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            // Wind Speed
            Row(
              children: [
                const Icon(Icons.air, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  "Angin: ${data.windSpeed?.toStringAsFixed(1) ?? '0.0'} m/s",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),

            // Wind Direction
            Row(
              children: [
                const Icon(Icons.explore, color: Colors.orange),
                const SizedBox(width: 8),
                Text(
                  "Arah: ${data.windDirection?.toStringAsFixed(0) ?? '0'}° ${_getWindDirectionLabel(data.windDirection ?? 0.0)}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),

            // Rainfall
            Row(
              children: [
                const Icon(Icons.water_drop, color: Colors.lightBlue),
                const SizedBox(width: 8),
                Text(
                  "Hujan: ${data.rainfall?.toStringAsFixed(1) ?? '0.0'} mm",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
