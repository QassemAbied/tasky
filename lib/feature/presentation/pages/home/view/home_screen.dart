import 'package:flutter/material.dart';
import 'package:tasky/core/helper/extension.dart';
import 'package:tasky/core/helper/spacing.dart';
import 'package:tasky/core/theme/app_text_style.dart';
import 'package:tasky/feature/presentation/pages/home/view/widgets/achieved_task_widget.dart';
import 'package:tasky/feature/presentation/pages/home/view/widgets/custom_app_bar_widget.dart';
import 'package:tasky/feature/presentation/pages/home/view/widgets/floating_button_widgets.dart';
import 'package:tasky/feature/presentation/pages/home/view/widgets/high_priortiy_list.dart';
import 'package:tasky/feature/presentation/pages/home/view/widgets/my_task_list.dart';
import 'package:tasky/feature/presentation/pages/home/view/widgets/text_welcome_widget.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                 CustomAppBarWidget(),
                  TextWelcomeWidget(),
                  AchievedTaskWidget(),
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
