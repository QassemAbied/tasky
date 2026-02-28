import 'package:flutter/material.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';
import '../../../add_task/view/add_task_screen.dart';

class FloatingButtonWidgets extends StatelessWidget {
  const FloatingButtonWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AddTaskScreen()),
        );
      },
      icon: Icon(Icons.add, color: AppColors.bgColorLight),
      label: Text(
        'Add New Task',
        style: AppTextStyle.medium(fontSize: 14, color: AppColors.bgColorLight),
      ),
    );
  }
}
