import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import '../providers/sensor_provider.dart';

class SensorCard extends StatelessWidget {
  const SensorCard({super.key});

  Color _getTempColor(double temp) {
    if (temp < 20) return Colors.blue;
    if (temp < 30) return Colors.orange;
    return Colors.red;
  }

  Color _getHumidityColor(double humid) {
    if (humid < 40) return Colors.orangeAccent;
    if (humid < 70) return Colors.blue;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    final sensorData = Provider.of<SensorProvider>(context).data;
    final temperature = sensorData.temperature;
    final humidity = sensorData.humidity;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 4,
      margin: const EdgeInsets.all(12),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Sensor Monitoring",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            // Display both indicators horizontally
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Suhu
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                    begin: 0,
                    end: (temperature / 50).clamp(0.0, 1.0),
                  ),
                  duration: const Duration(milliseconds: 800),
                  builder: (context, value, child) {
                    return CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 12.0,
                      percent: value,
                      center: Text(
                        "${(value * 50).toStringAsFixed(1)}°C",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      footer: const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text("Suhu"),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: _getTempColor(value * 50),
                      backgroundColor: Colors.grey.shade200,
                    );
                  },
                ),

                // Kelembaban
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(
                    begin: 0,
                    end: (humidity / 100).clamp(0.0, 1.0),
                  ),
                  duration: const Duration(milliseconds: 800),
                  builder: (context, value, child) {
                    return CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 12.0,
                      percent: value,
                      center: Text(
                        "${(value * 100).toStringAsFixed(1)}%",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18.0,
                        ),
                      ),
                      footer: const Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: Text("Kelembaban"),
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                      progressColor: _getHumidityColor(value * 100),
                      backgroundColor: Colors.grey.shade200,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
