import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/constants/app_constants.dart';
import 'package:tasky/core/helper/shared_pref.dart';
import 'package:tasky/core/theme/theme_controller/theme_state.dart';
import '../../uitls/enum.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeInitial()) {
    saveThemeData();
  }
  static ThemeCubit get(context) => BlocProvider.of(context);
  ThemeModeEnum currentTheme = ThemeModeEnum.system;
  Future selectedThemeMode(ThemeModeEnum mode) async {
    currentTheme = mode;
    await SharedPrefHelper.setData(
      key: AppConstants.themeModeKey,
      value: mode.name,
    );
    emit(SelectedTheme(themeMode: currentTheme));
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
    emit(SelectedTheme(themeMode: currentTheme));
  }
}
