import 'package:codebase_assignment/utils/themes/app_color_theme.dart';
import 'package:flutter/material.dart';


class AppTextTheme {
  static const TextTheme lightTextTheme = TextTheme(
    displayLarge: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textPrimary,fontFamily: "Inter_18pt-Black" ),
    displayMedium: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Color(0xFF044694),fontFamily: "Inter" ),
    displaySmall: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, color: Color(0xFF034694),fontFamily: "Inter" ),
    bodyLarge: TextStyle(fontSize: 18, color: Color(0xFF034694), fontWeight: FontWeight.w400,fontFamily: "Inter" ),
  
  );

}