import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/common_widgets/my_task_list_widget.dart';
import '../../../../controller/home_cubit/home_cubit.dart';
import '../../../../controller/home_cubit/home_state.dart';

class MyTaskList extends StatelessWidget {
  const MyTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final tasks = state.noHighPriorityTasks;

        switch (state.highPriority) {
          case HighPriority.initial:
            return SliverToBoxAdapter(child: SizedBox());
          case HighPriority.loading:
            return SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            );
          case HighPriority.loaded:
            return MyTaskListWidget(tasks: tasks);
          case HighPriority.error:
            return Center(child: Text(state.error ?? "Something went wrong"));
        }
      },
    );
  }
}
