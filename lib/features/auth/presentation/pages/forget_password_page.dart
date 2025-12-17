import 'package:booknoke/core/theme/color_manager.dart';
import 'package:booknoke/features/shared/presentation/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';

class ForgetPasswordPage extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();

  ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      backgroundColor: ColorsManager.darkBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      titlePadding: const EdgeInsets.fromLTRB(20, 20, 10, 0),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text("Forgot Password"),
          IconButton(
            icon: const Icon(Icons.close, color: Colors.grey),
            onPressed: () => Navigator.pop(context), // close button
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Please enter your email address to reset your password."),
          const SizedBox(height: 16),
          TextfieldWidget(
            controller: emailController,
            hint: 'Enter your email address', onChanged: (String query) {  },
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Remember your password?", style: TextStyle(color: ColorsManager.grey, fontSize: 12)),
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // close dialog
                  // Example: Navigate to login page
                  // Navigator.push(context, MaterialPageRoute(builder: (_) => const LoginPage()));
                },
                child: const Text(
                  "Log in",
                  style: TextStyle(color: ColorsManager.lightAccent),
                ),
              ),
            ],
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(140, 40),
            backgroundColor: ColorsManager.darkSurface,
          ),
          onPressed: () {
            // Handle password reset logic here
          
          },
          child: const Text(
            'Send Reset Link',
            style: TextStyle(fontSize: 15, color: ColorsManager.white),
          ),
        ),
      ],
    );
  }
}
