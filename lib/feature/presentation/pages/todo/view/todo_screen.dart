import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/helper/spacing.dart';
import '../../../../../core/common_widgets/my_task_list_widget.dart';
import '../../../controller/home_controller/home_provider.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To Do Tasks')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: verticalSpace(20),),
          Consumer<HomeProvider>(builder: (BuildContext context, HomeProvider value, Widget? child) {
            final controller= value.todoTask;

            return  MyTaskListWidget(tasks:controller );
          },),

        ],
      ),
    );
  }
}
