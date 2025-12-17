import 'package:flutter/material.dart';
import 'package:booknoke/core/assets/assets.dart';
import 'package:booknoke/core/theme/color_manager.dart';
import 'package:booknoke/features/book/presentation/widgets/friends_book_card.dart';
import 'package:booknoke/features/book/presentation/widgets/reading_progress.dart';
import 'package:booknoke/features/book/presentation/widgets/welcome_card.dart';
import 'package:booknoke/features/shared/presentation/widgets/buttonn.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBackground,
      appBar: AppBar(
        backgroundColor: ColorsManager.darkBackground,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Image.asset(Assets.booknook),
        ),
        title: const Text(
          "BookNook",
          style: TextStyle(
            color: ColorsManager.white,
            fontSize: 22,
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded, color: ColorsManager.white),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const WelcomeCard(name: "Ghita"),
            const SizedBox(height: 25),

            // Navigation Quick Actions
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: BoxDecoration(
                color: ColorsManager.darkSecondary,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _QuickActionButton(icon: Icons.add, label: "Add", onTap: () {}),
                  _QuickActionButton(icon: Icons.auto_awesome, label: "Match", onTap: () {}),
                  _QuickActionButton(icon: Icons.explore_outlined, label: "Explore", onTap: () {}),
                ],
              ),
            ),

            const SizedBox(height: 30),
            _sectionHeader("Currently Reading"),
            ReadingProgress(
              progress: 0.65,
              title: 'The Silent Patient',
              author: 'Alex Michaelides',
              coverImageUrl: Assets.book,
            ),

            const SizedBox(height: 30),
            _sectionHeader("Friends Activity"),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                FriendsBookCard(
                  avatar: Assets.avatar,
                  name: 'Ahmed',
                  date: DateTime.now(),
                  bookAuthor: "Dostoevsky",
                  bookImage: Assets.book,
                  bookTitle: 'Crime and Punishment',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15, left: 5),
      child: Text(
        title,
        style: const TextStyle(
          color: ColorsManager.white,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _QuickActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _QuickActionButton({required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: ColorsManager.darkAccent.withOpacity(0.2),
            child: Icon(icon, color: ColorsManager.darkAccent),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(color: ColorsManager.grey, fontSize: 12)),
        ],
      ),
    );
  }
}