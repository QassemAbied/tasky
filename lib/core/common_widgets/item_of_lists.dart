import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/uitls/enum.dart';
import 'package:tasky/feature/domain/entities/task_entities.dart';

import '../helper/extension.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';
import '../../feature/presentation/controller/home_cubit/home_cubit.dart';

class ItemOfLists extends StatelessWidget {
  const ItemOfLists({
    super.key,

    this.isTrailing = true, required this.onChanged,  required this.taskEntities,
  });
  final TaskEntities taskEntities;
  //final String taskName;
 // final String taskDescription;
 // final bool checked1;
  final bool isTrailing;
  final Function(bool) onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        activeColor: AppColors.primaryColor,
        value: taskEntities.isDone,
        onChanged: (value) {
          if (value != null) {
            onChanged(value);

          }

        },
      ),
      title: Text(
        taskEntities.taskName,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.regular(
          fontSize: 16,
          color: context.textPrimary,
        ).copyWith(decoration: taskEntities.isDone ? TextDecoration.lineThrough : null),
      ),
      subtitle: taskEntities.taskDescription.isNotEmpty? Text(
        taskEntities.taskDescription,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyle.regular(
          fontSize: 16,
          color: context.textSecondary,
        ).copyWith(decoration: taskEntities.isDone ? TextDecoration.lineThrough : null),
      ): null,

      trailing:isTrailing?PopupMenuButton<TaskItemActionsEnum>(
        onSelected: (value){
          switch(value){
            case TaskItemActionsEnum.mark:
              onChanged(!taskEntities.isDone);
            case TaskItemActionsEnum.delete:
             context.read<HomeCubit>().deleteTask(taskEntities.id);
            case TaskItemActionsEnum.edit:
              // TODO: Handle this case.
              throw UnimplementedError();
          }
        },
          itemBuilder: (context)=>

         TaskItemActionsEnum.values.map((e){
         return PopupMenuItem<TaskItemActionsEnum>(
            value: e,
            child: Text(e.name,
            ),);
        }).toList()


      ):null

    );
  }
}
