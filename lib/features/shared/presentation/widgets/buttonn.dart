import 'package:booknoke/core/theme/color_manager.dart';
import 'package:flutter/material.dart';

class Buttonn extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const Buttonn({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 60,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsManager.darkBackground,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.zero,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: ColorsManager.lightAccent, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: const TextStyle(
                color: ColorsManager.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
