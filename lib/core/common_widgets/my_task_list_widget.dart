import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/feature/domain/entities/task_entities.dart';
import '../../feature/presentation/controller/home_cubit/home_cubit.dart';
import '../../feature/presentation/pages/home/view/widgets/item_of_lists.dart';
import '../helper/spacing.dart';

class MyTaskListWidget extends StatelessWidget {
  const MyTaskListWidget({super.key, required this.tasks});

  final List<TaskEntities> tasks;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(bottom: 80,right: 16,left: 16),
      sliver: SliverList.separated(

        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ItemOfLists(
              taskName: tasks[index].taskName,
              checked1: tasks[index].isDone,
              onChanged: (bool value) {
                context.read<HomeCubit>().toggleMyTask(tasks[index], value);

              }, taskDescription: tasks[index].taskDescription,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return verticalSpace(8);
        },
      ),
    );
  }
}
