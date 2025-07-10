import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/sensor_card.dart';
import '../widgets/weather_card.dart';
import '../widgets/location_card.dart';
import '../providers/weather_provider.dart';
import '../services/location_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final position = await LocationService.getCurrentLocation();
      if (position != null) {
        Provider.of<WeatherProvider>(
          context,
          listen: false,
        ).fetchWeatherByLocation(position.latitude, position.longitude);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final weatherData = Provider.of<WeatherProvider>(context).data;

    return Scaffold(
      appBar: AppBar(title: const Text("Weather Dashboard")),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView(
          children: [
            const LocationCard(location: "Subang, Indonesia"),
            const SizedBox(height: 10),
            weatherData != null
                ? const WeatherCard()
                : const Center(child: CircularProgressIndicator()),
            const SizedBox(height: 10),
            const SensorCard(),
          ],
        ),
      ),
    );
  }
}
