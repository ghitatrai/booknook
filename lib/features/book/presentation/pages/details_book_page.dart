import 'dart:ui';

import 'package:booknoke/core/assets/assets.dart';
import 'package:booknoke/core/theme/color_manager.dart';
import 'package:flutter/material.dart';

class DetailsBookPage extends StatelessWidget {
  const DetailsBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.darkBackground,
      body: CustomScrollView(
        slivers: [
          // Elegant Header with Book Cover
          SliverAppBar(
            expandedHeight: 350,
            backgroundColor: ColorsManager.darkSecondary,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.asset(Assets.book, fit: BoxFit.cover),
                  // Gradient overlay to make text readable
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Colors.transparent, ColorsManager.darkBackground],
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 220,
                      width: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [BoxShadow(color: Colors.black54, blurRadius: 20)],
                        image: DecorationImage(image: AssetImage(Assets.book), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  const Text("The Silent Patient", 
                    style: TextStyle(color: ColorsManager.white, fontSize: 26, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  const Text("By Alex Michaelides", 
                    style: TextStyle(color: ColorsManager.darkAccent, fontSize: 16, fontWeight: FontWeight.w500)),
                  
                  const SizedBox(height: 30),
                  
                  // Action Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDetailStat(Icons.star, "4.8", "Rating"),
                      _buildDetailStat(Icons.menu_book, "340", "Pages"),
                      _buildDetailStat(Icons.language, "ENG", "Language"),
                    ],
                  ),

                  const SizedBox(height: 30),
                  const Text(
                    "Description",
                    style: TextStyle(color: ColorsManager.white, fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Alicia Berenson’s life is seemingly perfect. A famous painter married to an in-demand fashion photographer, she lives in a grand house with big windows overlooking a park in one of London’s most desirable areas...",
                    style: TextStyle(color: ColorsManager.grey.withOpacity(0.9), fontSize: 15, height: 1.6),
                  ),
                  
                  const SizedBox(height: 40),
                  
                  // Floating Style Primary Button
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.darkAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text("Start Reading Now", 
                        style: TextStyle(color: ColorsManager.white, fontSize: 16, fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildDetailStat(IconData icon, String value, String label) {
    return Column(
      children: [
        Icon(icon, color: ColorsManager.grey, size: 20),
        const SizedBox(height: 8),
        Text(value, style:  TextStyle(color: ColorsManager.white, fontWeight: FontWeight.bold)),
        Text(label, style:  TextStyle(color: ColorsManager.grey, fontSize: 12)),
      ],
    );
  }
}