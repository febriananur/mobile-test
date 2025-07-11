import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sensor_provider.dart';

class BatteryStatusCard extends StatelessWidget {
  const BatteryStatusCard({super.key});

  IconData _getBatteryIcon(double level) {
    if (level >= 90) return Icons.battery_full;
    if (level >= 60) return Icons.battery_6_bar;
    if (level >= 30) return Icons.battery_3_bar;
    if (level >= 10) return Icons.battery_alert;
    return Icons.battery_0_bar;
  }

  Color _getBatteryColor(BuildContext context, double level) {
    if (level >= 60) return Colors.green;
    if (level >= 30) return Colors.orange;
    return Theme.of(context).colorScheme.error;
  }

  @override
  Widget build(BuildContext context) {
    final battery = Provider.of<SensorProvider>(context).data.batteryLevel;
    final icon = _getBatteryIcon(battery);
    final color = _getBatteryColor(context, battery);

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: color, size: 32),
        title: const Text("Battery Status"),
        subtitle: Text("${battery.toStringAsFixed(0)}%"),
      ),
    );
  }
}
