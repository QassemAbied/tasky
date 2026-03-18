
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/helper/extension.dart';
import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/theme/app_text_style.dart';
import '../../../../../../core/theme/theme_controller/theme_cubit.dart';
import '../../../../../../core/uitls/enum.dart';
import '../../../../controller/user_details_controller/user_details_provider.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var currentMode = Theme.of(context).brightness == Brightness.dark;

    return Consumer<UserDetailsProvider>(
      builder: (BuildContext context, UserDetailsProvider value, Widget? child) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage:
              ( value.image==null)
                  ? AssetImage(
                'assets/images/image_avater.png',
              )
                  : FileImage(File(value.image!)),
              backgroundColor: Colors.transparent,
            ),

            horizontalSpace(16),
            Expanded(
              //flex:5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    //fit:BoxFit.scaleDown,
                    child: Text(
                      'Good Evening , ${value.name} ',
                      style: AppTextStyle.regular(
                        fontSize: 16,
                        color: context.textPrimary,
                      ),
                    ),
                  ),
                  Text(
                    value.quote??'',
                    style: AppTextStyle.regular(
                      fontSize: 14,
                      color: context.textSecondary,
                    ),
                  ),
                ],
              ),
            ),

            GestureDetector(
              onTap: () {
                if (currentMode) {
                  context.read<ThemeCubit>().selectedThemeMode(
                    ThemeModeEnum.light,
                  );
                } else {
                  context.read<ThemeCubit>().selectedThemeMode(
                    ThemeModeEnum.dark,
                  );
                }
              },
              child: CircleAvatar(
                backgroundColor: context.textSurface,
                child: currentMode
                    ? SvgPicture.asset('assets/svgs/dark_icon.svg')
                    : SvgPicture.asset('assets/svgs/light_icon.svg'),
              ),
            ),
          ],
        );
      },);}
}
