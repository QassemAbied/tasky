import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/feature/presentation/controller/home_cubit/home_controller.dart';
import '../../../../../core/common_widgets/my_task_list_widget.dart';
import '../../../../../core/helper/spacing.dart';

class HighPriorityScreen extends StatelessWidget {
  const HighPriorityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('High Priority')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: verticalSpace(20)),
          Consumer<HomeController>(builder: (BuildContext context, HomeController value, Widget? child) {
            final controller= context.read<HomeController>().highPriorityTasks;

            return  MyTaskListWidget(tasks:controller );
          },),
        ],
      ),
    );
  }
}
