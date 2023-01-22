import 'package:flutter/material.dart';
import 'package:pit02gp07/src/core/theme/app_colors.dart';
import 'package:pit02gp07/src/core/theme/app_text_style.dart';

class AppTheme {
  static ThemeData get theme {
    return ThemeData(
      fontFamily: 'Roboto',
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColors.mediumGray,
        unselectedItemColor: AppColors.iceWhite,
        selectedItemColor: AppColors.darkGold,
      ),
      cardColor: AppColors.mediumGray,
      scaffoldBackgroundColor: AppColors.darkGray,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.lightGold,
        foregroundColor: AppColors.darkGray,
      ),
      appBarTheme: const AppBarTheme(
        color: AppColors.darkGreen,
        titleTextStyle: AppTextStyle.largeWhite,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(
            const Size(
              double.maxFinite,
              40,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            AppColors.darkGreen,
          ),
          foregroundColor: MaterialStateProperty.all(
            AppColors.iceWhite,
          ),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
        ),
      ),
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: AppColors.darkGold,
        onPrimary: AppColors.iceWhite,
        secondary: AppColors.iceWhite,
        onSecondary: AppColors.iceWhite,
        error: AppColors.iceWhite,
        onError: AppColors.iceWhite,
        background: AppColors.iceWhite,
        onBackground: AppColors.iceWhite,
        surface: AppColors.iceWhite,
        onSurface: AppColors.iceWhite,
      ),
    );
  }
}
