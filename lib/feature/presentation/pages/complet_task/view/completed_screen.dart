import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common_widgets/my_task_list_widget.dart';
import '../../../../../core/helper/spacing.dart';
import '../../../../../core/uitls/di.dart';
import '../../../controller/home_cubit/home_cubit.dart';
import '../../../controller/home_cubit/home_state.dart';

class CompletedScreen extends StatelessWidget {
  const CompletedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Completed Tasks')),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: verticalSpace(20),),
          BlocBuilder<HomeCubit, HomeState>(
            builder: (context, state) {
              final tasks = state.completedTask;

              switch (state.completedStatus) {
                case CompletedStatus.loading:
                  return SliverToBoxAdapter(
                    child: Center(child: CircularProgressIndicator()),
                  );

                case CompletedStatus.loaded:
                  return MyTaskListWidget(tasks: tasks);

                case CompletedStatus.error:
                  return SliverToBoxAdapter(
                    child: Center(child: Text(state.error?? "Something went wrong"),),
                  );

                case CompletedStatus.initial:
                  return SliverToBoxAdapter(child: Center(child: SizedBox()));
              }
            },
          ),
        ],
      ),
    );
  }
}