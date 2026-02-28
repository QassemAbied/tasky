import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/constants/app_constants.dart';
import 'package:tasky/core/helper/shared_pref.dart';
import 'package:tasky/feature/data/model/task_model.dart';
import 'package:tasky/feature/domain/entities/task_entities.dart';
import 'package:tasky/feature/presentation/controller/add_task_cubit/add_new_task_cubit.dart';
import '../../../../../../core/helper/spacing.dart';
import '../../../../controller/home_cubit/home_cubit.dart';
import '../../../../controller/home_cubit/home_state.dart';
import 'item_of_lists.dart';

class MyTaskList extends StatelessWidget {
  const MyTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        final tasks = cubit.noHighPriorityTasks;
        if (state.status == HomeStatus.loaded) {
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
        } else if (state.status == HomeStatus.initial) {
          return SliverToBoxAdapter(child: SizedBox());
        }
        return SliverToBoxAdapter(child: SizedBox());
      },
    );
  }
}
