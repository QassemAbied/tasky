import 'package:tasky/feature/domain/entities/task_entities.dart';

class AddNewTaskState {}

class AddNewTaskInitial extends AddNewTaskState {}

class HighPriorityChanged extends AddNewTaskState {
  final bool isSelected;
  HighPriorityChanged({required this.isSelected});
}

class AddTaskLoading extends AddNewTaskState {}

class AddTaskSuccess extends AddNewTaskState {
  final TaskEntities taskEntities;

  AddTaskSuccess(this.taskEntities);
}

class AddTaskFailure extends AddNewTaskState {
  final String error;

  AddTaskFailure(this.error);
}
