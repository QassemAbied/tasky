import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tasky/feature/domain/entities/task_entities.dart';
import 'package:tasky/feature/presentation/controller/home_cubit/home_controller.dart';
import 'item_of_lists.dart';
import '../helper/extension.dart';
import '../helper/spacing.dart';
import '../theme/app_text_style.dart';

class MyTaskListWidget extends StatelessWidget {
  const MyTaskListWidget({super.key, required this.tasks});

  final List<TaskEntities> tasks;

  @override
  Widget build(BuildContext context) {
    return tasks.isNotEmpty
        ? SliverPadding(
            padding: EdgeInsets.only(bottom: 80, right: 16, left: 16),
            sliver: SliverList.separated(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ItemOfLists(
                    onChanged: (bool value) {
                      context.read<HomeController>().toggleMyTask(
                        tasks[index],
                        value,
                      );
                    },
                    taskEntities: tasks[index],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return verticalSpace(8);
              },
            ),
          )
        : SliverToBoxAdapter(
            child: Center(
              child: Text(
                'No Data',
                style: AppTextStyle.bold(
                  fontSize: 20,
                  color: context.textPrimary,
                ),
              ),
            ),
          );
  }
}
