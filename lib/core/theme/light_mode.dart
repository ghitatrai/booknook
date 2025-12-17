import 'package:booknoke/core/theme/color_manager.dart';
import 'package:flutter/material.dart';

ThemeData LightModeTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: ColorsManager.lightBackground,
    surface: ColorsManager.lightSurface,
    secondary: ColorsManager.lightSecondary,
    primary: ColorsManager.lightAccent,
  ),
);