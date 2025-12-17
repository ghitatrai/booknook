import 'package:booknoke/core/assets/assets.dart';
import 'package:booknoke/features/book/presentation/widgets/books_widget.dart';
import 'package:flutter/material.dart';

class FavoriteBooksPage extends StatelessWidget {
  const FavoriteBooksPage({super.key});

   @override
  Widget build(BuildContext context) {
    // Example list of books
    final books = [
      {"title": "The Silent Patient", "author": "Alex Marcendies", "image": Assets.book},
      {"title": "1984", "author": "George Orwell", "image": Assets.book},
      {"title": "We Hunt the Flames", "author": "Hafsa Khan", "image": Assets.book},
      {"title": "The Dead Romantics", "author": "Ashley Poston", "image": Assets.book},
      
    ];

    return Scaffold(
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return BooksWidget(
            bookImage: Image.asset(book['image']!),
            bookTitle: book['title']!,
            bookAuthor: book['author']!,
          );
        },
      ),
    );
  }
}