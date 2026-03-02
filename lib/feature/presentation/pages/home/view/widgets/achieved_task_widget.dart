import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tasky/feature/presentation/controller/home_cubit/home_cubit.dart';
import 'package:tasky/feature/presentation/controller/home_cubit/home_state.dart';

import '../../../../../../core/helper/extension.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';

class AchievedTaskWidget extends StatelessWidget {
  const AchievedTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final total = state.todoTask.length + state.completedTask.length;
        final percent = total == 0 ? 0.0 : state.completedTask.length / total;
        return Card(
          child: ListTile(
            title: Text(
              'Achieved Tasks',
              style: AppTextStyle.regular(
                fontSize: 16,
                color: context.textPrimary,
              ),
            ),
            subtitle: Text(
              '${state.todoTask.length} Out of ${state.completedTask.length} Done',
              style: AppTextStyle.regular(
                fontSize: 16,
                color: context.textSecondary,
              ),
            ),
            trailing: CircularPercentIndicator(
              radius: 25,
              percent: percent,
              center: Text('${(percent * 100).toInt()}%'),
              progressColor: AppColors.primaryColor,
            ),
          ),
        );
      },
    );
  }
}
