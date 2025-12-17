import 'package:booknoke/core/theme/color_manager.dart';
import 'package:booknoke/features/book/presentation/pages/details_book_page.dart';
import 'package:flutter/material.dart';

class BooksWidget extends StatelessWidget {
  final Image bookImage;
  final String bookTitle;
  final String bookAuthor;
  final VoidCallback? onTap;

  const BooksWidget({
    super.key,
    required this.bookImage,
    required this.bookTitle,
    required this.bookAuthor, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => const DetailsBookPage()));
      },

      child: Container(
        
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: ColorsManager.darkSurface,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            // Book cover
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: SizedBox(
                width: 50,
                height: 70,
                child: bookImage,
              ),
            ),
            const SizedBox(width: 10),
            // Title & author
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookTitle,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: ColorsManager.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  Text(
                    "by $bookAuthor",
                    style: const TextStyle(
                      fontSize: 10,
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
      ),
    );
  }
}
