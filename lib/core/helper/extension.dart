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
extension Navigation on BuildContext {
  Future<dynamic> pushNamed(String routeName, {Object? arguments}) {
    return Navigator.of(this).pushNamed(routeName, arguments: arguments);
  }
  Future<dynamic> push(Route<dynamic> routeName, ) {
    return Navigator.of(this).push(routeName,);
  }

  Future<dynamic> pushReplacementNamed(String routeName, {Object? arguments}) {
    return Navigator.of(
      this,
    ).pushReplacementNamed(routeName, arguments: arguments);
  }

  void pop() {
    if (Navigator.of(this).canPop()) {
      Navigator.of(this).pop();
    }
  }

  void popUntil(String routeName) {
    Navigator.of(this).popUntil((route) => route.settings.name == routeName);
  }


  ColorScheme get colors => Theme.of(this).colorScheme;
}