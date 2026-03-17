import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../core/common_widgets/my_task_list_widget.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../controller/home_cubit/home_controller.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Completed Tasks')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: verticalSpace(20),),
          Consumer<HomeController>(builder: (BuildContext context, HomeController value, Widget? child) {
            final controller= context.read<HomeController>().completedTask;

            return  MyTaskListWidget(tasks:controller );
          },),
        ],
      ),
    );
  }
}