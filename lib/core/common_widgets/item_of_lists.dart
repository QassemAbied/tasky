import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/uitls/enum.dart';
import 'package:tasky/feature/domain/entities/task_entities.dart';
import 'package:tasky/feature/presentation/controller/home_cubit/home_controller.dart';
import '../../feature/presentation/controller/add_task_cubit/add_new_task_cubit.dart';
import '../../feature/presentation/pages/add_task/view/widgets/high_priority_widget.dart';
import '../../feature/presentation/pages/add_task/view/widgets/text_field_widget.dart';
import '../helper/extension.dart';
import '../theme/app_colors.dart';
import '../theme/app_text_style.dart';

class ItemOfLists extends StatelessWidget {
  const ItemOfLists({
    super.key,

    this.isTrailing = true,
    required this.onChanged,
    required this.taskEntities,
  });
  final TaskEntities taskEntities;

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
        onSelected: (value)async{
          switch(value){
            case TaskItemActionsEnum.mark:
              onChanged(!taskEntities.isDone);
            case TaskItemActionsEnum.delete:
             await _showDialog( context);

            case TaskItemActionsEnum.edit:
             await _showModelSheet(context);
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
  Future<void> _showDialog(BuildContext context){
    final controller = context.read<HomeController>();
    return showDialog(context: context, builder: (context){
      final isDark = Theme.of(context).brightness == Brightness.dark;
      return AlertDialog(
        backgroundColor: isDark?AppColors.bgColorDark:AppColors.bgColorLight,
        title: Text('Delete Task'),
        content: Text('Are you sure you want to delete this task?'),
        actions: [
          TextButton(
            onPressed: (){
            Navigator.pop(context);
          }, child: Text('Cancel',style: AppTextStyle.semiBold(fontSize: 16, color: Colors.red)),),
          TextButton(

            onPressed: (){
              controller.deleteTask(taskEntities.id);
              Navigator.pop(context);
            }, child: Text('Delete',style: AppTextStyle.semiBold(fontSize: 16, color: context.textPrimary),),),

        ],
      );
    });
  }
  Future<void> _showModelSheet(BuildContext context) async {
    final controller = context.read<HomeController>();
    final TextEditingController nameTaskController =
    TextEditingController(text: taskEntities.taskName);

    final TextEditingController descriptionTaskController =
    TextEditingController(text: taskEntities.taskDescription);
    final cubit = AddNewTaskCubit.get(context);

    cubit.isSelected = taskEntities.highPriority;
    final GlobalKey<FormState> key = GlobalKey<FormState>();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SingleChildScrollView(
            child: Form(
              key: key,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Task Name',
                    style: AppTextStyle.regular(
                      fontSize: 16,
                      color: context.textPrimary,
                    ),
                  ),

                  TextFieldWidget(
                    nameTaskController: nameTaskController,
                    descriptionTaskController: descriptionTaskController,
                  ),

                  HighPriorityWidget(),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {
                        if (key.currentState!.validate()) {
                          controller.editTask(TaskEntities(
                            id: taskEntities.id,
                              isDone: taskEntities.isDone,
                              taskName: nameTaskController.text,
                              taskDescription: descriptionTaskController.text,
                              highPriority: cubit.isSelected,
                          ));
                        }
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text('Edit'),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }




}





