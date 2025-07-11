import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/sensor_provider.dart';

class PressureCard extends StatelessWidget {
  const PressureCard({super.key});

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<SensorProvider>(context).data;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: const Icon(Icons.speed, size: 36),
        title: const Text("Tekanan Udara"),
        subtitle: Text("${data.pressure.toStringAsFixed(1)} hPa"),
      ),
    );
  }
}
