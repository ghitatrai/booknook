import 'package:booknoke/core/theme/color_manager.dart';
import 'package:flutter/material.dart';

class TextfieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final bool obscureText;
  final Widget? suffixIcon;

  const TextfieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    this.obscureText = false,
    this.suffixIcon, required void Function(String query) onChanged,
  });


  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: ColorsManager.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: ColorsManager.darkSecondary,
        hintText: hint,
        hintStyle: const TextStyle(color: ColorsManager.grey),
        prefixIcon: const Icon(Icons.search, color: ColorsManager.grey),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: ColorsManager.darkAccent, width: 1),
        ),
      ),
    );
  }
}