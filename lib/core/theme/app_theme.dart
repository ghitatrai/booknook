import 'package:booknoke/core/theme/color_manager.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // Light Theme
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorsManager.primaryBlue,
    scaffoldBackgroundColor: ColorsManager.white,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.primaryBlue,
      titleTextStyle: TextStyle(
        color: ColorsManager.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: ColorsManager.white),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: ColorsManager.primaryGreen,
        foregroundColor: ColorsManager.white,
        textStyle: TextStyle(fontWeight: FontWeight.bold),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: ColorsManager.black,
      ),
      displayMedium: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: ColorsManager.black,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: ColorsManager.black),
      bodyMedium: TextStyle(fontSize: 14, color: ColorsManager.grey),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: ColorsManager.grey.withOpacity(0.1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: ColorsManager.primaryRed,
    ),
  );

  // Dark Theme (optional)
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: ColorsManager.primaryBlue,
    scaffoldBackgroundColor: ColorsManager.black,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.primaryBlue,
      titleTextStyle: TextStyle(
        color: ColorsManager.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(color: ColorsManager.white),
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
      ),
      bodyLarge: TextStyle(fontSize: 16, color: ColorsManager.white),
      bodyMedium: TextStyle(fontSize: 14, color: ColorsManager.grey),
    ),
  );
}
