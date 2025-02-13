import 'package:flutter/material.dart';
import 'package:codebase_assignment/utils/themes/app_color_theme.dart';

class CustomTextFeild extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final IconData? prefixIcon;
  final Color? iconColor;

  const CustomTextFeild({
    super.key,
    required this.controller,
    this.labelText = "Search",
    this.hintText,
    this.prefixIcon,
    this.iconColor ,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText ,
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: iconColor) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.textPrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
      ),
    );
  }
}
