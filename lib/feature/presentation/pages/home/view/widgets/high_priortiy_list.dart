import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/helper/extension.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';
import '../../../../controller/home_cubit/home_cubit.dart';
import '../../../../controller/home_cubit/home_state.dart';
import 'item_of_lists.dart';

class HighPriorityList extends StatelessWidget {
  const HighPriorityList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        final tasks = cubit.highPriorityTasks;
        if (state.status == HomeStatus.loaded) {
          return Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'High Priority Tasks',
                    style: AppTextStyle.regular(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Expanded(
                        flex: 4,
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: tasks.length,
                          itemBuilder: (context, index) {
                            return ItemOfLists(
                              taskDescription: tasks[index].taskDescription,
                              taskName: tasks[index].taskName,
                              checked1: tasks[index].isDone,
                              isTrailing: false,
                              onChanged: (bool value) {
                                context.read<HomeCubit>().toggleMyTask(tasks[index], value);
                              },
                            );
                          },
                        ),
                      ),
                      Expanded(
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            border: Border.all(color: context.textBorder),
                            shape: BoxShape.circle,
                          ),
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: SvgPicture.asset(
                              'assets/svgs/arrow_icon.svg',
                              colorFilter: ColorFilter.mode(
                                context.textSecondary,
                                BlendMode.srcIn,
                              ),
                              width: 25,
                              height: 25,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        } else if (state.status == HomeStatus.initial) {
          return SizedBox();
        }
        return SizedBox();
      },
    );
  }
}
