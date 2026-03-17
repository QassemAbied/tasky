import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/feature/presentation/controller/add_task_controller/add_task_provider.dart';
import '../../../../../../core/helper/extension.dart';
import '../../../../../../core/theme/app_text_style.dart';

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
        Selector<AddTaskProvider, bool?>(
          selector: (BuildContext context, AddTaskProvider controller) =>controller.isSelected,

          builder: (BuildContext context, bool? value, Widget? child) {
            return Switch(
              value: value!,
              onChanged: (value) {
               context.read<AddTaskProvider>().toggleHighPriority(value);
              },
            );
          },
        ),

        // BlocBuilder<AddNewTaskCubit, AddNewTaskState>(
        //   builder: (context, state) {
        //     final cubit = AddNewTaskCubit.get(context);
        //     return Switch(
        //       value: cubit.isSelected,
        //       onChanged: (value) {
        //         cubit.toggleHighPriority(value);
        //       },
        //     );
        //   },
        // ),
      ],
    );
  }
}
