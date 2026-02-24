import 'package:flutter/material.dart';
import 'package:tasky/core/theme/app_colors.dart';
import 'package:tasky/core/theme/app_text_style.dart';

class AppTheme {
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.bgColorLight,
      primaryColor: AppColors.primaryColor,

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgColorLight,
        elevation: 0.0,
        titleTextStyle: AppTextStyle.regular(
          fontSize: 20,
          color: AppColors.primaryTextLight,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceLight,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.borderLight),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
          foregroundColor: WidgetStatePropertyAll(AppColors.bgColorLight),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          textStyle: WidgetStatePropertyAll(
            AppTextStyle.medium(fontSize: 15, color: AppColors.bgColorLight),
          ),
        ),
      ),
    );
  }

  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      useMaterial3: true,
      scaffoldBackgroundColor: AppColors.bgColorDark,
      primaryColor: AppColors.primaryColor,

      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgColorDark,
        elevation: 0.0,
        titleTextStyle: AppTextStyle.regular(
          fontSize: 20,
          color: AppColors.primaryTextDark,
        ),
      ),
      cardTheme: CardThemeData(
        color: AppColors.surfaceDark,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: AppColors.borderDark),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(AppColors.primaryColor),
          foregroundColor: WidgetStatePropertyAll(AppColors.bgColorLight),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          ),
          fixedSize: WidgetStatePropertyAll(Size.fromHeight(50)),
          textStyle: WidgetStatePropertyAll(
            AppTextStyle.medium(fontSize: 15, color: AppColors.bgColorLight),
          ),
        ),
      ),
    );
  }
}
