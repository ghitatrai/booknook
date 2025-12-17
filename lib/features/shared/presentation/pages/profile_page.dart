import 'package:booknoke/core/assets/assets.dart';
import 'package:flutter/material.dart';
import 'package:booknoke/core/theme/color_manager.dart';
class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBackground,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            backgroundColor: ColorsManager.darkSecondary,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 40),
                  CircleAvatar(
                    radius: 45,
                    backgroundColor: ColorsManager.darkAccent,
                    child: CircleAvatar(radius: 42, backgroundImage: AssetImage(Assets.avatar)),
                  ),
                  const SizedBox(height: 10),
                  const Text("Ghita Trai", 
                    style: TextStyle(color: ColorsManager.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  Text("ghita.t@email.com", 
                    style: TextStyle(color: ColorsManager.grey, fontSize: 14)),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      _buildStatCard("Books", "47"),
                      const SizedBox(width: 15),
                      _buildStatCard("Friends", "86"),
                    ],
                  ),
                  const SizedBox(height: 25),
                  _buildProfileTile(Icons.library_books, "My Library"),
                  _buildProfileTile(Icons.favorite, "Favorites"),
                  _buildProfileTile(Icons.settings, "Settings"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatCard(String label, String value) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: ColorsManager.darkSurface,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Text(value, style: const TextStyle(color: ColorsManager.white, fontSize: 18, fontWeight: FontWeight.bold)),
            Text(label, style: const TextStyle(color: ColorsManager.grey, fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileTile(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: ColorsManager.darkSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon, color: ColorsManager.darkAccent),
        title: Text(title, style: const TextStyle(color: ColorsManager.white)),
        trailing: const Icon(Icons.chevron_right, color: ColorsManager.grey),
      ),
    );
  }
}