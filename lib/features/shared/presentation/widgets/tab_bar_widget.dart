import 'package:booknoke/core/theme/color_manager.dart';
import 'package:booknoke/features/book/presentation/pages/favorite_books_page.dart';
import 'package:booknoke/features/book/presentation/pages/reading_now.dart';
import 'package:flutter/material.dart';

class TabBarWidget extends StatelessWidget {
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          forceMaterialTransparency: true,
          title: const Text("My Books"),
         // Inside TabBarWidget
bottom: TabBar(
  isScrollable: true,
  dividerColor: Colors.transparent,
  indicator: BoxDecoration(
    borderRadius: BorderRadius.circular(25),
    color: ColorsManager.darkAccent.withOpacity(0.2),
  ),
  labelColor: ColorsManager.darkAccent,
  unselectedLabelColor: ColorsManager.grey,
  tabs: const [
    Tab(child: Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text("Reading"))),
    Tab(child: Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text("Favorites"))),
    Tab(child: Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text("Want to Read"))),
    Tab(child: Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text("Finished"))),
  ],
),
        ),
        body: const TabBarView(
          children: [
            ReadingNow(),
            FavoriteBooksPage(),
            Center(child: Text("👤 Profile Page")),
            Center(child: Text("👤 Profile Page")),
          ],
        ),
      ),
    );
  }
}
