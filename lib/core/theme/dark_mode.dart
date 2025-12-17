import 'package:booknoke/core/theme/color_manager.dart';
import 'package:flutter/material.dart';

ThemeData DarkModeTheme = ThemeData(
  brightness: Brightness.dark,
  // primarySwatch: Colors.blue,
  // scaffoldBackgroundColor: Colors.black,
  colorScheme: ColorScheme.dark(
    background: ColorsManager.darkBackground,
    surface: ColorsManager.darkSurface,
    secondary: ColorsManager.darkSecondary,
    primary: ColorsManager.darkAccent,
  ),
  // useMaterial3: true,
);