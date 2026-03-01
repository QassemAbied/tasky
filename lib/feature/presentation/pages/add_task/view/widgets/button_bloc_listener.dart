import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/feature/presentation/controller/add_task_cubit/add_new_task_cubit.dart';
import 'package:tasky/feature/presentation/controller/add_task_cubit/add_new_task_state.dart';
import 'package:tasky/feature/presentation/controller/home_cubit/home_cubit.dart';

import '../../../botton_nav_view.dart';
import '../../../home/view/home_screen.dart';

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
            builder: (context) {
              return Center(child: CircularProgressIndicator());
            },
          );
        }
        else if(state is AddTaskSuccess) {
          Navigator.pop(context);

          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => BottonNavView(),
            ),
                (route) => false,

          );
        }
      },
        child: child,
    );
  }
}
