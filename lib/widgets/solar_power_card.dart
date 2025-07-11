import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sensor_provider.dart';

class SolarPowerCard extends StatelessWidget {
  const SolarPowerCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SensorProvider>(context).data;

    final voltage = data.solarVoltage;
    final current = data.solarCurrent;
    final power = voltage * current;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "🔆 Solar Power",
              style: Theme.of(
                context,
              ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                _buildInfoBox("Voltage", "${voltage.toStringAsFixed(1)} V"),
                const SizedBox(width: 12),
                _buildInfoBox("Current", "${current.toStringAsFixed(2)} A"),
                const SizedBox(width: 12),
                _buildInfoBox("Power", "${power.toStringAsFixed(1)} W"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoBox(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black12.withOpacity(0.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}
