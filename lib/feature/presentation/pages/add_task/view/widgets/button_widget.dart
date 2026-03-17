import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tasky/feature/presentation/controller/add_task_controller/add_task_provider.dart';
import '../../../../../domain/entities/task_entities.dart';
import '../../../../controller/home_controller/home_provider.dart';

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
    return Builder(
      builder: (context) {
        return SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: [
              Spacer(),
              Padding(
                padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () async {
                      final controller = context.read<AddTaskProvider>();
                      if (globalKey.currentState?.validate() ?? false) {
                        controller.addTaskLoad(
                          task: TaskEntities(
                            taskName: taskName.text,
                            taskDescription: taskDescription.text,
                            highPriority: controller.isSelected,
                          ),
                        );
                        // Navigator.of(context, rootNavigator: true).pop();
                        context.read<HomeProvider>().loadData();
                        Navigator.pop(context);
                      }
                    },
                    icon: Icon(Icons.add),
                    label: Text('Add Task'),
                  ),

                ),
              ),
              Spacer(),
            ],
          ),
        );
      },
    );
  }
}
