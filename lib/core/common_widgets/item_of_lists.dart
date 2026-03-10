import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/helper/extension.dart';
import '../../../../../../core/theme/app_colors.dart';
import '../../../../../../core/theme/app_text_style.dart';
import '../../../../controller/home_cubit/home_cubit.dart';

class ItemOfLists extends StatelessWidget {
  const ItemOfLists({
    super.key,
    required this.taskName,
    required this.checked1,
    this.isTrailing = true, required this.onChanged, required this.taskDescription,
  });
  final String taskName;
  final String taskDescription;
  final bool checked1;
  final bool isTrailing;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: AppColors.primaryColor,
        value: checked1,
        onChanged: (value) {
          if (value != null) {
            onChanged(value);

          }

        },
      ),
      title: Text(
        taskName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.regular(
          fontSize: 16,
          color: context.textPrimary,
        ).copyWith(decoration: checked1 ? TextDecoration.lineThrough : null),
      ),
      subtitle: taskDescription.isNotEmpty? Text(
        taskDescription,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.regular(
          fontSize: 16,
          color: context.textSecondary,
        ).copyWith(decoration: checked1 ? TextDecoration.lineThrough : null),
      ): null,

      trailing: isTrailing
          ? IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))
          : null,
    );
  }
}
