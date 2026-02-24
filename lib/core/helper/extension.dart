import 'package:flutter/material.dart';
import 'package:tasky/core/theme/app_colors.dart';

extension TextColorExtension on BuildContext {
  bool get isDark => Theme.of(this).brightness == Brightness.dark;
  Color get textPrimary =>
      isDark ?
      AppColors.primaryTextDark : AppColors.primaryTextLight;
  Color get textSecondary =>
      isDark ?
      AppColors.secondaryTextDark : AppColors.secondaryTextLight;
  Color get textTertiary =>
      isDark ?
      AppColors.tertiaryTextDark : AppColors.tertiaryTextLight;
  Color get textPlaceholder =>
      isDark ?
      AppColors.placeholderTextDark : AppColors.placeholderTextLight;
  Color get textBorder => isDark ? AppColors.borderDark : AppColors.borderLight;
  Color get textSurface => isDark ? AppColors.surfaceDark : AppColors.surfaceLight;

}
