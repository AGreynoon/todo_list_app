import 'package:flutter/material.dart';
import 'package:todo_list_app/themes/appColors.dart';

class Apptheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.primary,
      scaffoldBackgroundColor: AppColors.homePageBackgroundColor,
      cardColor: AppColors.cardColor,
      iconTheme: const IconThemeData(color: AppColors.iconColor),
      navigationBarTheme: const NavigationBarThemeData(
        backgroundColor: AppColors.navigationBarColor,
      ),
      useMaterial3: true,
    );
  }
}
