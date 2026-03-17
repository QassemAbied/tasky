import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/helper/extension.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';
import '../../../../controller/home_cubit/home_controller.dart';

class AchievedTaskWidget extends StatelessWidget {
  const AchievedTaskWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController value, Widget? child) {
        final total = value.todoTask.length + value.completedTask.length;
        final percent = total == 0 ? 0.0 : value.completedTask.length / total;
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
              '${value.todoTask.length} Out of ${value.completedTask.length} Done',
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
      },);
  }
}
