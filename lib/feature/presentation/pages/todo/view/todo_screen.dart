import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common_widgets/my_task_list_widget.dart';
import '../../../../../core/uitls/di.dart';
import '../../../controller/home_cubit/home_cubit.dart';
import '../../../controller/home_cubit/home_state.dart';

class TodoScreen extends StatelessWidget {
  const TodoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<HomeCubit>(),
      child: Scaffold(
        appBar: AppBar(title: Text('To Do Tasks')),
        body: CustomScrollView(
          slivers: [
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                final tasks = state.todoTask;

                switch (state.todoStatus) {
                  case TodoStatus.loading:
                    return SliverToBoxAdapter(
                      child: Center(child: CircularProgressIndicator()),
                    );

                  case TodoStatus.loaded:
                    return MyTaskListWidget(tasks: tasks);

                  case TodoStatus.error:
                    return SliverToBoxAdapter(
                      child: Center(child: Text(e.toString())),
                    );

                  case TodoStatus.initial:
                    return SliverToBoxAdapter(child: Center(child: SizedBox()));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
