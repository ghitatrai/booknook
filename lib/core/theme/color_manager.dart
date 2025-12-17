import 'package:flutter/material.dart';

class ColorsManager {
  /// ---------------- DARK MODE ----------------
  static const Color darkBackground = Color(0xFF151d19); // Main background
  static const Color darkSurface = Color(0xFF19392B);    // Cards / containers
  static const Color darkSecondary = Color(0xFF16251E);  // AppBar / NavBar
  static const Color darkAccent = Color(0xFF3FB36A);     // Buttons / highlights

  /// ---------------- LIGHT MODE ----------------
  static const Color lightBackground = Color(0xFFFFFFFF); // Main background
  static const Color lightSurface = Color(0xFFF5F5F5);    // Cards / containers
  static const Color lightSecondary = Color(0xFFE0E0E0);  // AppBar / NavBar
  static const Color lightAccent = Color(0xFF3FB36A);     // Buttons / highlights

  /// ---------------- COMMON COLORS ----------------
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color grey = Colors.grey;

  // Optional: Primary brand palette
  static const Color primaryBlue = Color(0xFF82A1FD);
  static const Color primaryGreen = Color(0xFF59B379);
  static const Color primaryYellow = Color(0xFFF4CA44);
  static const Color primaryRed = Color(0xFFFF5757);
}
