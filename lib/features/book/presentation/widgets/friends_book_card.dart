import 'package:booknoke/core/theme/color_manager.dart';
import 'package:flutter/material.dart';

class FriendsBookCard extends StatelessWidget {
  final String avatar;       // image path
  final String name;         // friend name
  final DateTime date;       // date
  final String bookImage;    // book cover path
  final String bookTitle;    // book title
  final String bookAuthor;   // book author

  const FriendsBookCard({
    super.key,
    required this.avatar,
    required this.name,
    required this.date,
    required this.bookImage,
    required this.bookTitle,
    required this.bookAuthor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: ColorsManager.darkSecondary,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Row with avatar and name
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage(avatar),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.white,
                        ),
                      ),
                      Text(
                        "${date.day}/${date.month}/${date.year}",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // Book image + info side by side
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    bookImage,
                    height: 100,
                    width: 70,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        bookTitle,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: ColorsManager.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        "by $bookAuthor",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),

            // Action buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    // TODO: like action
                  },
                  icon: const Icon(Icons.favorite_border),
                  color: ColorsManager.lightAccent,
                ),
                TextButton(
                  onPressed: () {
                    // TODO: comment action
                  },
                  child: const Text(
                    "Comment",
                    style: TextStyle(color: ColorsManager.lightAccent),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    // TODO: comment action
                  },
                 icon: const Icon(Icons.bookmark_add),
                  color: ColorsManager.lightAccent,
                  
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
