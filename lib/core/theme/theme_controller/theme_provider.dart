import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import '../../constants/app_constants.dart';
import '../../uitls/enum.dart';

class ThemeProvider with ChangeNotifier{


  final Box themeBox= Hive.box(AppConstants.themeBox);
  ThemeModeEnum currentTheme = ThemeModeEnum.system;
  Future selectedThemeMode(ThemeModeEnum mode) async {
    currentTheme = mode;

  await  themeBox.put(AppConstants.themeModeKey, mode.name, );
   notifyListeners();
  }

  ThemeMode themeMode() {
    switch (currentTheme) {
      case ThemeModeEnum.light:
        return ThemeMode.light;
      case ThemeModeEnum.dark:
        return ThemeMode.dark;
      case ThemeModeEnum.system:
        return ThemeMode.system;
    }
  }

  void saveThemeData() {
    final saveThemeMode = themeBox.get(AppConstants.themeModeKey);


    if (saveThemeMode != null) {
      currentTheme = ThemeModeEnum.values.firstWhere(
            (e) => e.name == saveThemeMode,
        orElse: () => ThemeModeEnum.system,
      );
    }
    notifyListeners();
  }
}