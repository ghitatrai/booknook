import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:booknoke/core/theme/color_manager.dart';
import 'package:booknoke/features/book/presentation/pages/home_page.dart';
import 'package:booknoke/features/shared/presentation/pages/friends_page.dart';
import 'package:booknoke/features/shared/presentation/pages/profile_page.dart';
import 'package:booknoke/features/shared/presentation/pages/search_page.dart';
import 'package:booknoke/features/shared/presentation/widgets/tab_bar_widget.dart';
import 'package:flutter/material.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _currentIndex = 0;

  final List<IconData> _icons = [
    Icons.home,
    Icons.menu_book_outlined,
    Icons.people_alt_outlined,
    Icons.search,
    Icons.person,

  ];

  final List<Widget> _pages = [
    const HomePage(),
    const TabBarWidget(),
    const FriendsPage(),
    const SearchPage(),
     ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        
        icons: _icons,
        activeIndex: _currentIndex,
        activeColor: ColorsManager.darkSurface,   // Highlighted
        inactiveColor: ColorsManager.lightAccent,      // Softer inactive state
        iconSize: 28,
        leftCornerRadius: 24,
        rightCornerRadius: 24,
        gapLocation: GapLocation.none,            // no FAB gap
        notchSmoothness: NotchSmoothness.smoothEdge,
        onTap: (index) => setState(() => _currentIndex = index),
      ),
    );
  }
}
