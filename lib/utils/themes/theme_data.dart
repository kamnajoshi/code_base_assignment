import 'package:codebase_assignment/utils/themes/app_color_theme.dart';
import 'package:codebase_assignment/utils/themes/text_theme.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  primaryColor: AppColors.background,
  scaffoldBackgroundColor: Color(0xFFF7F9FD),
  colorScheme: ColorScheme.light(
    primary: AppColors.background,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
  ),
  textTheme: AppTextTheme.lightTextTheme,
);
