import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/helper/extension.dart';
import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/theme/app_text_style.dart';
import '../../../../../../core/theme/theme_controller/theme_cubit.dart';
import '../../../../../../core/uitls/enum.dart';
import '../../../../controller/user_details/user_details_cubit.dart';
import '../../../../controller/user_details/user_details_state.dart';

class CustomAppBarWidget extends StatelessWidget {
  const CustomAppBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    var currentMode = Theme.of(context).brightness == Brightness.dark;

    return BlocBuilder<UserDetailsCubit, UserDetailsState>(
      builder: (context, state) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage('assets/images/image_avater.png'),
              width: 50,
              height: 50,
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
                      'Good Evening , ${state.userName} ',
                      style: AppTextStyle.regular(
                        fontSize: 16,
                        color: context.textPrimary,
                      ),
                    ),
                  ),
                  Text(
                    state.quote,
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
      },
    );
  }
}
