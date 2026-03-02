import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/feature/presentation/controller/add_task_cubit/add_new_task_cubit.dart';
import 'package:tasky/feature/presentation/controller/add_task_cubit/add_new_task_state.dart';
import 'package:tasky/feature/presentation/controller/home_cubit/home_cubit.dart';

class ButtonBlocListener extends StatelessWidget {
  const ButtonBlocListener({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddNewTaskCubit, AddNewTaskState>(
      listener: (BuildContext context, AddNewTaskState state) {
        if (state is AddTaskLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        } else if (state is AddTaskSuccess) {
          Navigator.of(context, rootNavigator: true).pop();
          context.read<HomeCubit>().loadData();
          Navigator.pop(context);
        }
      },
      child: child,
    );
  }
}
