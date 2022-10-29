import 'package:flutter/material.dart';
import 'package:pit02gp07/src/shared/constants/app_colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: AppColors.darkerGreen,
      fontFamily: 'Roboto',
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        buttonColor: AppColors.lightGold,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkGray,
        unselectedItemColor: AppColors.iceWhite,
        selectedItemColor: AppColors.darkGold,
      ),
      cardColor: AppColors.darkGray,
      scaffoldBackgroundColor: AppColors.darkGreen,
    );
  }
}


