// Apply this logic to both reading_now.dart and favorite_books_page.dart

import 'package:booknoke/core/assets/assets.dart';
import 'package:booknoke/core/theme/color_manager.dart';
import 'package:booknoke/features/book/presentation/widgets/books_widget.dart';
import 'package:flutter/material.dart';

class ReadingNow extends StatelessWidget {
  const ReadingNow({super.key});

  @override
  Widget build(BuildContext context) {
    final readingBooks = [
      {"title": "The Silent Patient", "author": "Alex Michaelides", "image": Assets.book, "progress": 0.7},
      {"title": "Project Hail Mary", "author": "Andy Weir", "image": Assets.book, "progress": 0.3},
      {"title": "Atomic Habits", "author": "James Clear", "image": Assets.book, "progress": 0.9},
      {"title": "Circe", "author": "Madeline Miller", "image": Assets.book, "progress": 0.1},
    ];

    return Scaffold(
      backgroundColor: ColorsManager.darkBackground,
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        itemCount: readingBooks.length,
        itemBuilder: (context, index) {
          final book = readingBooks[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: BooksWidget(
              bookImage: Image.asset(book['image'] as String, fit: BoxFit.cover),
              bookTitle: book['title'] as String,
              bookAuthor: book['author'] as String,
              // Adding a progress indicator specifically for "Reading Now"
              // trailing: Text(
              //   "${((book['progress'] as double) * 100).toInt()}%",
              //   style: const TextStyle(color: ColorsManager.darkAccent, fontWeight: FontWeight.bold),
              // ),
            ),
          );
        },
      ),
    );
  }
}