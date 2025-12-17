// Intro1.dart (The Brand Intro)
import 'dart:ui';

import 'package:booknoke/core/assets/assets.dart';
import 'package:booknoke/core/theme/color_manager.dart';
import 'package:flutter/material.dart';

class Intro1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorsManager.darkBackground,
      padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // A glowing effect around the logo
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: ColorsManager.darkAccent.withOpacity(0.2),
                  blurRadius: 50,
                  spreadRadius: 10,
                ),
              ],
            ),
            child: Image.asset(Assets.booknook, width: 180, height: 180),
          ),
          const SizedBox(height: 40),
          Text(
            'Connect through Stories',
            style: const TextStyle(
              color: ColorsManager.white,
              fontSize: 26,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.1,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Text(
            'Discover what your friends are reading and share your own favorites.',
            style: TextStyle(color: ColorsManager.grey.withOpacity(0.8), fontSize: 16, height: 1.5),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}