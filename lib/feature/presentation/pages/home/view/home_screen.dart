import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tasky/core/constants/app_constants.dart';
import 'package:tasky/core/helper/extension.dart';
import 'package:tasky/core/helper/shared_pref.dart';
import 'package:tasky/core/helper/spacing.dart';
import 'package:tasky/core/theme/app_colors.dart';
import 'package:tasky/core/theme/app_text_style.dart';
import 'package:tasky/feature/presentation/pages/home/view/widgets/floating_button_widgets.dart';
import 'package:tasky/feature/presentation/pages/home/view/widgets/high_priortiy_list.dart';
import 'package:tasky/feature/presentation/pages/home/view/widgets/my_task_list.dart';
import '../../../../../core/theme/theme_controller/theme_cubit.dart';
import '../../../../../core/uitls/enum.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final String? nameUser;
  @override
  void initState() {
    lodNameUser();
    super.initState();
  }

  void lodNameUser() {
    nameUser = SharedPrefHelper.getString(key: AppConstants.nameKey);
  }

  @override
  Widget build(BuildContext context) {
    var currentMode = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image(
                        image: AssetImage('assets/images/image_avater.png'),
                        width: 50,
                        height: 50,
                      ),
                      horizontalSpace(16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Evening , $nameUser ',
                            style: AppTextStyle.regular(
                              fontSize: 16,
                              color: context.textPrimary,
                            ),
                          ),
                          Text(
                            'One task at a time.One step\n closer.',
                            style: AppTextStyle.regular(
                              fontSize: 14,
                              color: context.textSecondary,
                            ),
                          ),
                        ],
                      ),
                      Spacer(),
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
                              : SvgPicture.asset(
                                  'assets/svgs/light_icon.svg',
                                ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(15.0),
                  Text(
                    'Yuhuu ,Your work Is ',
                    style: AppTextStyle.regular(
                      fontSize: 32,
                      color: context.textSecondary,
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        'almost done !',
                        style: AppTextStyle.regular(
                          fontSize: 32,
                          color: context.textSecondary,
                        ),
                      ),
                      SvgPicture.asset('assets/svgs/waving-hand.svg'),
                    ],
                  ),
                  verticalSpace(15.0),
                  Card(
                    child: ListTile(
                      title: Text(
                        'Achieved Tasks',
                        style: AppTextStyle.regular(
                          fontSize: 16,
                          color: context.textPrimary,
                        ),
                      ),
                      subtitle: Text(
                        '3 Out of 6 Done',
                        style: AppTextStyle.regular(
                          fontSize: 14,
                          color: context.textSecondary,
                        ),
                      ),
                      trailing: CircularPercentIndicator(
                        radius: 25,
                        //  lineWidth: 5.0,
                        percent: 0.50,
                        center: Text("50%"),
                        progressColor: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  verticalSpace(15.0),
                  HighPriorityList(),
                  verticalSpace(15.0),
                  Text(
                    'My Tasks',
                    style: AppTextStyle.regular(
                      fontSize: 20,
                      color: context.textPrimary,
                    ),
                  ),
                ]),
              ),
            ),
            MyTaskList(),
          ],
        ),
        floatingActionButton: FloatingButtonWidgets(),
      ),
    );
  }
}
