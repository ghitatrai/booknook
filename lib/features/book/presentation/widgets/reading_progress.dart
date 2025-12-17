import 'package:booknoke/core/theme/color_manager.dart';
import 'package:flutter/material.dart';

class ReadingProgress extends StatelessWidget {
 final double progress;
  final String title;
  final String author;
  final String coverImageUrl;

  const ReadingProgress({
    super.key,
    required this.progress,
    required this.title,
    required this.author,
    required this.coverImageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsManager.darkSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: ColorsManager.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(coverImageUrl, height: 90, width: 60, fit: BoxFit.cover),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(color: ColorsManager.white, fontWeight: FontWeight.bold, fontSize: 16)),
                Text(author, style: const TextStyle(color: ColorsManager.grey, fontSize: 13)),
                const SizedBox(height: 12),
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: ColorsManager.darkBackground,
                  color: ColorsManager.darkAccent,
                  minHeight: 4,
                ),
                const SizedBox(height: 8),
                Text("${(progress * 100).toInt()}% completed", style: const TextStyle(color: ColorsManager.darkAccent, fontSize: 12, fontWeight: FontWeight.w600)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}