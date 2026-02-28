import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../domain/entities/task_entities.dart';
import '../../../../controller/add_task_cubit/add_new_task_cubit.dart';
import '../../../../controller/add_task_cubit/add_new_task_state.dart';
import '../../../home/view/home_screen.dart';
import 'button_bloc_listener.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.globalKey,
    required this.taskName,
    required this.taskDescription,
  });
  final GlobalKey<FormState> globalKey;
  final TextEditingController taskName;
  final TextEditingController taskDescription;

  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Column(
        children: [
          Spacer(),
          Padding(
            padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 20),
            child: SizedBox(
              width: double.infinity,
              child: BlocBuilder<AddNewTaskCubit, AddNewTaskState>(
                builder: (context, state) {
                  final cubit = context.read<AddNewTaskCubit>();
                  return ButtonBlocListener(
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        if (globalKey.currentState?.validate() ?? false) {
                          cubit.addTaskLoad(
                            task: TaskEntities(
                              taskName: taskName.text,
                              taskDescription: taskDescription.text,
                              highPriority: cubit.isSelected,
                            ),
                          );

                        }
                      },
                      icon: Icon(Icons.add),
                      label: Text('Add Task'),
                    ),
                  );
                },
              ),
            ),
          ),
          Spacer(),
        ],
      ),
    );
  }
}
