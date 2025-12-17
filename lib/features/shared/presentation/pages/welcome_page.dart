import 'package:booknoke/core/assets/assets.dart';
import 'package:booknoke/core/theme/color_manager.dart';
import 'package:booknoke/features/auth/presentation/pages/login_page.dart';
import 'package:booknoke/features/auth/presentation/pages/sign_up_page.dart';
import 'package:flutter/material.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.booknook,
              width: 150,
              height: 150,
            ),
            const SizedBox(height: 20),
            Text(
              'Books are better when shared.',
              style: Theme.of(context).textTheme.bodyMedium,
              
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
                backgroundColor: ColorsManager.darkSecondary, // Set a minimum size for buttons
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              },
              child: const Text('Log In', style: TextStyle(fontSize: 15, color: ColorsManager.white),),
            ),
            const SizedBox(height: 15),
             ElevatedButton(
                 style: ElevatedButton.styleFrom(
                minimumSize: const Size(300, 50),
                backgroundColor: ColorsManager.darkSurface, // Set a minimum size for buttons
              ),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
              },
              child: const Text('Sign Up',style: TextStyle(fontSize: 15, color: ColorsManager.white)),
            ),
          ],
        ),
      ),
    );
  }
}