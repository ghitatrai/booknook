import 'package:booknoke/core/theme/color_manager.dart';
import 'package:booknoke/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:booknoke/features/auth/presentation/bloc/auth_event.dart';
import 'package:booknoke/features/auth/presentation/bloc/auth_state.dart';
import 'package:booknoke/features/auth/presentation/pages/forget_password_page.dart';
import 'package:booknoke/features/auth/presentation/pages/sign_up_page.dart';
import 'package:booknoke/features/shared/presentation/widgets/navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController =
      TextEditingController(text: 'test@test.com');
  final TextEditingController passwordController =
      TextEditingController(text: 'password');

  bool _obscurePassword = true;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Widget buildTextField({
    required TextEditingController controller,
    required String hint,
    bool obscureText = false,
    Widget? suffixIcon,
  }) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: ColorsManager.lightAccent,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: ColorsManager.darkSurface,
            width: 2,
          ),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        suffixIcon: suffixIcon,
      ),
      style: const TextStyle(
        color: ColorsManager.white,
        fontSize: 16,
      ),
    );
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
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Theme.of(context).iconTheme.color),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.question_mark_outlined, color: Theme.of(context).iconTheme.color),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthFailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is AuthSuccess) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Navigation()),
            );
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SizedBox(
                height: MediaQuery.of(context).size.height, // full screen height
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top content
                    Column(
                      children: [
                        const SizedBox(height: 40),
                        Text(
                          "Log In BookNook",
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        const SizedBox(height: 60),
                        buildTextField(controller: emailController, hint: "Email"),
                        const SizedBox(height: 15),
                        buildTextField(
                          controller: passwordController,
                          hint: "Password",
                          obscureText: _obscurePassword,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword ? Icons.visibility_off : Icons.visibility,
                              color: Colors.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                        ),
                        const SizedBox(height: 5),
                       Align(
  alignment: Alignment.centerRight,
  child: TextButton(
    onPressed: () {
      showDialog(
        context: context,
        barrierDismissible: false, // can’t dismiss by tapping outside
        barrierColor: Colors.transparent, // 👈 keeps the background page visible
        builder: (context) => ForgetPasswordPage(),
      );
    },
    child: const Text(
      "Forgot Password?",
      style: TextStyle(
        fontSize: 15,
        color: ColorsManager.lightAccent,
      ),
    ),
  ),
),

                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(300, 50),
                            backgroundColor: ColorsManager.darkSurface,
                          ),
                          onPressed: () {
                            context.read<AuthBloc>().add(
                                  LoginRequested(
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ),
                                );
                          },
                          child: const Text("Login", style: TextStyle(fontSize: 15, color: ColorsManager.white)),
                        ),
                        const SizedBox(height: 20),
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

                    // Bottom content
                    Column(
                      children: [
                        Text(
                          "By continuing, you agree to our Terms of Service and Privacy Policy",
                          style: Theme.of(context).textTheme.bodySmall,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const SignUpPage()),
                            );
                          },
                          child: const Text(
                            "Create Account",
                            style: TextStyle(fontSize: 15, color: ColorsManager.lightAccent),
                          ),
                        ),
                        const SizedBox(height:85),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
