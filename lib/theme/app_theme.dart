import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      scaffoldBackgroundColor: const Color(0xFFF5F5F5),
      cardColor: Colors.white,
      colorScheme: const ColorScheme.light(
        primary: Colors.blueAccent,
        onPrimary: Colors.white,
        surface: Colors.white,
        onSurface: Colors.black87,
      ),
      iconTheme: const IconThemeData(color: Colors.black87),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.black87),
        bodyMedium: TextStyle(color: Colors.black54),
        titleLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: const Color(0xFF121212),
      cardColor: const Color(0xFF1E1E1E),
      colorScheme: const ColorScheme.dark(
        primary: Color.fromARGB(255, 3, 171, 177),
        onPrimary: Colors.black,
        surface: Color(0xFF1E1E1E),
        onSurface: Colors.white70,
      ),
      iconTheme: const IconThemeData(color: Colors.white70),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: Colors.white70),
        bodyMedium: TextStyle(color: Colors.white54),
        titleLarge: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }
}
