import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/theme/theme_controller/theme_provider.dart';
import '../../../../../../core/uitls/enum.dart';
import 'build_list_title.dart';

class BuildChangeThemeListTitle extends StatelessWidget {
  const BuildChangeThemeListTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BuildListTitle(
      image: isDark
          ? 'assets/svgs/light_icon.svg'
          : 'assets/svgs/dark_icon.svg',
      title: 'Dark Mode',

      trailing: Switch(
        value: isDark,
        onChanged: (value) {
          context.read<ThemeProvider>().selectedThemeMode(
            value ? ThemeModeEnum.dark : ThemeModeEnum.light,
          );
        },
      ),
      onTap: () {},
    );
  }
}
