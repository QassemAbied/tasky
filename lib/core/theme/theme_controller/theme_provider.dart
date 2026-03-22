import 'package:flutter/material.dart';

import '../../constants/app_constants.dart';
import '../../helper/shared_pref.dart';
import '../../uitls/enum.dart';

class ThemeProvider with ChangeNotifier{
  // void changeNotifier(){
  //   saveThemeData();
  //   notifyListeners();
  // }
  ThemeModeEnum currentTheme = ThemeModeEnum.system;
  Future selectedThemeMode(ThemeModeEnum mode) async {
    currentTheme = mode;
    await SharedPrefHelper.setData(
      key: AppConstants.themeModeKey,
      value: mode.name,
    );
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
    final saveThemeMode = SharedPrefHelper.getString(
      key: AppConstants.themeModeKey,
    );
    if (saveThemeMode != null) {
      currentTheme = ThemeModeEnum.values.firstWhere(
            (e) => e.name == saveThemeMode,
        orElse: () => ThemeModeEnum.system,
      );
    }
    notifyListeners();
  }
}