import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/sensor_card.dart';
import '../widgets/weather_card.dart';
import '../providers/weather_provider.dart';
import '../services/location_service.dart';
import '../widgets/location_map_card.dart';

double? lat, lon;
String? city;

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double? lat, lon;
  String? city;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      final position = await LocationService.getCurrentLocation();
      if (position != null) {
        lat = position.latitude;
        lon = position.longitude;

        city = await LocationService.getCityName(lat!, lon!);

        Provider.of<WeatherProvider>(
          context,
          listen: false,
        ).fetchWeatherByLocation(lat!, lon!);

        setState(() {}); // trigger rebuild
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
            if (lat != null && lon != null)
              LocationMapCard(latitude: lat!, longitude: lon!, cityName: city),
            const SizedBox(height: 10),
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
