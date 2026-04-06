import 'package:flutter/material.dart';

class AppButtonTextField extends StatelessWidget {
  final TextEditingController controller;
  final Color color;
  final String hintText;
  final IconData icon;
  final Color prefixIconColor;

  const AppButtonTextField({
    super.key,
    required this.controller,
    required this.color,
    required this.hintText,
    required this.icon,
    required this.prefixIconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            prefixIcon: Icon(
              icon,
              color: prefixIconColor,
            ),
            hintText: hintText,
            hintStyle: const TextStyle(
                color: Colors.grey, fontWeight: FontWeight.w400, fontSize: 16),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20))),
      ),
    );
  }
}
