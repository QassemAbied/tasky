import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/theme/theme_controller/theme_cubit.dart';
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
          context.read<ThemeCubit>().selectedThemeMode(
            value ? ThemeModeEnum.dark : ThemeModeEnum.light,
          );
        },
      ),
      onTap: () {},
    );
  }
}
