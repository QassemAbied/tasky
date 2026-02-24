import '../../uitls/enum.dart';

class ThemeState {}

class ThemeInitial extends ThemeState {}

class SelectedTheme extends ThemeState {
  final ThemeModeEnum themeMode;
  SelectedTheme({required this.themeMode});
}
