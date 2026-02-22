import 'package:flutter/material.dart';
import 'package:tasky/core/theme/app_colors.dart';

extension TextColorExtension on BuildContext {
  Color get textPrimary => Theme.of(this).brightness == Brightness.dark
      ? AppColors.primaryTextDark
      : AppColors.primaryTextLight;
  Color get textSecondary => Theme.of(this).brightness == Brightness.dark
      ? AppColors.secondaryTextDark
      : AppColors.secondaryTextLight;
  Color get textTertiary => Theme.of(this).brightness == Brightness.dark
      ? AppColors.tertiaryTextDark
      : AppColors.tertiaryTextLight;
}
