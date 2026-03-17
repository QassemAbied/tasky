import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/feature/presentation/controller/home_cubit/home_controller.dart';
import '../../../../../../core/common_widgets/my_task_list_widget.dart';

class MyTaskList extends StatelessWidget {
  const MyTaskList({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<HomeController>(
      builder: (BuildContext context, HomeController value, Widget? child) {
        final controller= context.read<HomeController>().noHighPriorityTasks;
        return MyTaskListWidget(tasks: controller);
      },);

  }
}
