import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../core/common_widgets/my_task_list_widget.dart';
import '../../../../controller/home_controller/home_provider.dart';

class MyTaskList extends StatelessWidget {
  const MyTaskList({super.key});

  @override
  Widget build(BuildContext context) {

    return Consumer<HomeProvider>(
      builder: (BuildContext context, HomeProvider value, Widget? child) {
        final controller= context.read<HomeProvider>().noHighPriorityTasks;
        return MyTaskListWidget(tasks: controller);
      },);

  }
}
