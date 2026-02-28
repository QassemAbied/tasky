import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/helper/extension.dart';
import 'package:tasky/core/theme/app_text_style.dart';
import 'package:tasky/feature/presentation/pages/add_task/view/widgets/button_widget.dart';
import 'package:tasky/feature/presentation/pages/add_task/view/widgets/high_priority_widget.dart';
import 'package:tasky/feature/presentation/pages/add_task/view/widgets/text_field_widget.dart';
import '../../../../../core/uitls/di.dart';
import '../../../controller/add_task_cubit/add_new_task_cubit.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final TextEditingController nameTaskController = TextEditingController();

  final TextEditingController descriptionTaskController =
      TextEditingController();

  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  void dispose() {
    nameTaskController.dispose();
    descriptionTaskController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text('New Task')),
      body: BlocProvider(
        create: (context) => sl<AddNewTaskCubit>(),
        child: Form(
          key: _key,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: EdgeInsets.all(16.0),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    Text(
                      'Task Name',
                      style: AppTextStyle.regular(
                        fontSize: 16,
                        color: context.textPrimary,
                      ),
                    ),
                    TextFieldWidget(
                      nameTaskController: nameTaskController,
                      descriptionTaskController: descriptionTaskController,
                    ),
                    HighPriorityWidget(),
                  ]),
                ),
              ),
              ButtonWidget(
                globalKey: _key,
                taskName: nameTaskController,
                taskDescription: descriptionTaskController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
