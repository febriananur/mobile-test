import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/sensor_provider.dart';
import 'providers/weather_provider.dart';
import 'providers/theme_provider.dart';
import 'screens/dashboard_screen.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SensorProvider()),
        ChangeNotifierProvider(create: (_) => WeatherProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer<ThemeProvider>(
        builder: (context, themeProvider, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Weather Dashboard',
            theme: ThemeData.light().copyWith(
              colorScheme: const ColorScheme.light(
                primary: Colors.blue,
                onSurface: Colors.black,
              ),
              cardColor: Colors.white,
              scaffoldBackgroundColor: Color(0xFFFDF6F8),
            ),
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.currentTheme,
            home: const DashboardScreen(),
          );
        },
      ),
    );
  }
}
