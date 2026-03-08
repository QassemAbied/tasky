import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common_widgets/my_task_list_widget.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../controller/home_cubit/home_cubit.dart';
import '../../../controller/home_cubit/home_state.dart';

class HighPriorityScreen extends StatelessWidget {
  const HighPriorityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('High Priority')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: verticalSpace(20)),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final tasks = state.highPriorityTasks;

              switch (state.highPriority) {
                case HighPriority.loading:
                  return SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );

                case HighPriority.loaded:
                  return MyTaskListWidget(tasks: tasks);

                case HighPriority.error:
                  return SliverToBoxAdapter(
                    child: Center(
                      child: Text(state.error ?? "Something went wrong"),
                    ),
                  );

                case HighPriority.initial:
                  return SliverToBoxAdapter(child: Center(child: SizedBox()));
              }
            },
          ),
        ],
      ),
    );
  }
}
