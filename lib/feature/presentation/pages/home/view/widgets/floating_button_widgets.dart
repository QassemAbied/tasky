import 'package:flutter/material.dart';
import 'package:tasky/core/helper/extension.dart';
import 'package:tasky/core/routing/routers.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';

class FloatingButtonWidgets extends StatelessWidget {
  const FloatingButtonWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        context.pushNamed(Routers.addTaskScreen);
      },
      icon: Icon(Icons.add, color: AppColors.bgColorLight),
      label: Text(
        'Add New Task',
        style: AppTextStyle.medium(fontSize: 14, color: AppColors.bgColorLight),
      ),
    );
  }
}
