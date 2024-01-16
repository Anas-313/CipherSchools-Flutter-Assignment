import 'package:flutter/material.dart';

class RoundTextfield extends StatelessWidget {
  final String labelName;
  final controller;
  final bool obscureText;
  IconButton? iconType;

  RoundTextfield(
      {super.key,
      required this.labelName,
      required this.obscureText,
      this.iconType,
      this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        suffixIcon: iconType,
        hintText: labelName,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFDDDDEF)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(color: Color(0xFFDDDDEF)),
        ),
      ),
    );
  }
}
