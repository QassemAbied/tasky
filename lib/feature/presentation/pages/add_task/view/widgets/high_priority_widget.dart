import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/helper/extension.dart';
import '../../../../../../core/theme/app_text_style.dart';
import '../../../../controller/add_task_cubit/add_new_task_cubit.dart';
import '../../../../controller/add_task_cubit/add_new_task_state.dart';

class HighPriorityWidget extends StatelessWidget {
  const HighPriorityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'High Priority ',
          style: AppTextStyle.regular(fontSize: 16, color: context.textPrimary),
        ),
        Spacer(),
        BlocBuilder<AddNewTaskCubit, AddNewTaskState>(
          builder: (context, state) {
            final cubit = AddNewTaskCubit.get(context);
            return Switch(
              value: cubit.isSelected,
              onChanged: (value) {
                cubit.toggleHighPriority(value);
              },
            );
          },
        ),
      ],
    );
  }
}
