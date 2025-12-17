// core/responsive/responsive_helper.dart
import 'package:flutter/material.dart';

class ResponsiveHelper {
  static double getWidth(BuildContext context, double fraction) =>
      MediaQuery.of(context).size.width * fraction;

  static double getHeight(BuildContext context, double fraction) =>
      MediaQuery.of(context).size.height * fraction;
}
