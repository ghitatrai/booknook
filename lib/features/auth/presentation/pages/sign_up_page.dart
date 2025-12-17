import 'package:booknoke/core/constants/strings.dart';
import 'package:booknoke/core/theme/color_manager.dart';
import 'package:booknoke/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:booknoke/features/auth/presentation/bloc/auth_event.dart';
import 'package:booknoke/features/auth/presentation/bloc/auth_state.dart';
import 'package:booknoke/features/auth/presentation/pages/login_page.dart';
import 'package:booknoke/features/shared/presentation/widgets/textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
   Widget buildSocialButton({
    required String label,
    required Widget icon,
    required Color backgroundColor,
    required VoidCallback onPressed,
  }) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(300, 50),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(width: 10),
          Text(
            label,
            style: const TextStyle(
              fontSize: 15,
              color: ColorsManager.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          } else if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text(AppStrings.signUpSuccess)),
            );
            Future.delayed(
              const Duration(milliseconds: 1500),
              () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const LoginPage()),
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return _buildSignUpForm(context);
        },
      ),
    );
  }

  Widget _buildSignUpForm(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Sign Up',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ColorsManager.white,
                ),
              ),
              const SizedBox(height: 24),

              // Username
              TextfieldWidget(
                controller: nameController,
                hint: "Username", onChanged: (String query) {  },
              ),
              const SizedBox(height: 10),

              // Email
              TextfieldWidget(
                controller: emailController,
                hint: "Email", onChanged: (String query) {  },
              ),
              const SizedBox(height: 10),

              // Password
              TextfieldWidget(
                controller: passwordController,
                obscureText: true,
                hint: "Password", onChanged: (String query) {  },
              ),
              const SizedBox(height: 20),

              // Sign up button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(300, 50),
                  backgroundColor: ColorsManager.darkSurface,
                ),
                onPressed: () {
                  final name = nameController.text.trim();
                  final email = emailController.text.trim();
                  final password = passwordController.text.trim();

                  context.read<AuthBloc>().add(
                        SignUpRequested(
                          name: name,
                          email: email,
                          password: password,
                        ),
                      );
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 15, color: ColorsManager.white),
                ),
              ),
              const SizedBox(height: 8),

              // Already have account?
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginPage()),
                  );
                },
                child: Text(
                  'Already have an account?',
                  style: TextStyle(
                    color: ColorsManager.lightAccent,
                    fontSize: 15,
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Divider with OR
              
                Row(
                          children: const [
                            Expanded(child: Divider(color: Colors.grey, thickness: 1, endIndent: 10)),
                            Text("OR", style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600)),
                            Expanded(child: Divider(color: Colors.grey, thickness: 1, indent: 10)),
                          ],
                        ),
                        const SizedBox(height: 15),
                        buildSocialButton(
                          label: 'Continue with Google',
                          icon: const Icon(Icons.g_mobiledata_outlined, color: ColorsManager.white, size: 24),
                          backgroundColor: ColorsManager.darkSurface,
                          onPressed: () {},
                        ),
                        const SizedBox(height: 10),
                        buildSocialButton(
                          label: 'Continue with Facebook',
                          icon: const Icon(Icons.facebook, color: ColorsManager.white, size: 24),
                          backgroundColor: ColorsManager.darkSecondary,
                          onPressed: () {},
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
