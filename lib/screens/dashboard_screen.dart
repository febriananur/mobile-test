import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/sensor_card.dart';
import '../widgets/weather_card.dart';
import '../widgets/wind_rain_card.dart';
import '../widgets/location_map_card.dart';
import '../widgets/solar_power_card.dart';
import '../widgets/battery_status_card.dart';
import '../widgets/pressure_card.dart';

import '../providers/weather_provider.dart';
import '../providers/theme_provider.dart';

import '../services/location_service.dart';

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

        setState(() {}); // Trigger rebuild
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Provider.of<ThemeProvider>(context).isDarkMode;
    final weatherData = Provider.of<WeatherProvider>(context).data;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather Dashboard"),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isWide = constraints.maxWidth >= 600;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(12),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                // Group 1: Power & Sensor Cards
                ...[
                  const SolarPowerCard(),
                  const BatteryStatusCard(),
                  const SensorCard(),
                ].map((card) {
                  return SizedBox(
                    width: isWide
                        ? (constraints.maxWidth / 2) - 18
                        : double.infinity,
                    child: card,
                  );
                }),

                // Group 2: Wind + Pressure combined into one column
                SizedBox(
                  width: isWide
                      ? (constraints.maxWidth / 2) - 18
                      : double.infinity,
                  child: Column(
                    children: const [
                      WindRainCard(),
                      SizedBox(height: 12),
                      PressureCard(),
                    ],
                  ),
                ),

                // Weather + Map Row
                if (lat != null && lon != null && weatherData != null)
                  IntrinsicHeight(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        const Expanded(child: WeatherCard()),
                        const SizedBox(width: 8),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(
                              context,
                            ).colorScheme.primary,
                            foregroundColor: Theme.of(
                              context,
                            ).colorScheme.onPrimary,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 12,
                            ),
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          icon: const Icon(Icons.location_pin),
                          label: const Text("Lihat Peta"),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) => SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.7,
                                child: LocationMapCard(
                                  latitude: lat!,
                                  longitude: lon!,
                                  cityName: city,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  )
                else
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
          );
        },
      ),
    );
  }
}
