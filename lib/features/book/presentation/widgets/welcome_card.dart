import 'package:booknoke/core/theme/color_manager.dart';
import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  final String name;
  const WelcomeCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [ColorsManager.darkAccent, ColorsManager.darkSurface],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: ColorsManager.darkAccent.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, 10),
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome back, $name!',
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorsManager.white,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'You have read 3 books this month. Keep it up!',
            style: TextStyle(
              fontSize: 14,
              color: ColorsManager.white.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }
}