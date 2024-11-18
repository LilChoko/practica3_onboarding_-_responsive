import 'package:flutter/material.dart';

class AppThemes {
  static final ThemeData dayTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    appBarTheme: const AppBarTheme(
      color: Colors.blue,
    ),
    scaffoldBackgroundColor: Colors.white,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black),
    ),
  );

  static final ThemeData nightTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey,
    appBarTheme: const AppBarTheme(
      color: Colors.black87,
    ),
    scaffoldBackgroundColor: Colors.black,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.white),
      bodyMedium: TextStyle(color: Colors.white),
    ),
  );

  static ThemeData customTheme(Color primaryColor, Color textColor) {
    return ThemeData(
      primaryColor: primaryColor,
      appBarTheme: AppBarTheme(
        color: primaryColor,
      ),
      scaffoldBackgroundColor:
          primaryColor, // Fondo principal al color personalizado seleccionado
      textTheme: TextTheme(
        bodyLarge: TextStyle(color: textColor),
        bodyMedium: TextStyle(color: textColor),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryColor,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
        ),
      ),
    );
  }
}
