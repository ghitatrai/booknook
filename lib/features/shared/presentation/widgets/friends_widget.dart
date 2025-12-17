import 'package:booknoke/core/theme/color_manager.dart';
import 'package:flutter/material.dart';

class FriendsWidget extends StatelessWidget {
  final String friend;
  final String image;
  final String reading;
  
  const FriendsWidget({
    super.key,
    required this.reading,
    required this.friend,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 400,
      height: 80,
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            ColorsManager.darkSurface,
            ColorsManager.darkAccent,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // Using NetworkImage for profile picture
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(image),
            onBackgroundImageError: (exception, stackTrace) {
              // Fallback if image fails to load
            },
            child: image.isEmpty ? Icon(Icons.person, color: ColorsManager.darkBackground) : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center, // Center content vertically
              children: [
                Text(
                  friend,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ColorsManager.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
                const SizedBox(height: 4),
                Text(
                  reading,
                  style: const TextStyle(
                    fontSize: 14,
                    color: ColorsManager.white,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ],
            ),
          ),
          // Optional: Add navigation button
          IconButton(
            onPressed: () {
              // TODO: Add navigation logic
            },
            icon: Icon(
              Icons.navigate_next, 
              color: ColorsManager.darkBackground,
            ),
          ),
        ],
      ),  
    );
  }
}