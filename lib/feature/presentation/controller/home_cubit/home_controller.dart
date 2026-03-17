import 'package:flutter/material.dart';
import 'package:tasky/feature/domain/entities/task_entities.dart';
import '../../../domain/usecases/delete_task_usecase.dart';
import '../../../domain/usecases/edit_task_usecase.dart';
import '../../../domain/usecases/get_task_usecase.dart';

class HomeController with ChangeNotifier {
  final GetTaskUseCase getTasksUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  final EditTaskUseCase _editTaskUseCase;
  HomeController(
    this.getTasksUseCase,
   this._deleteTaskUseCase,
    this._editTaskUseCase,
  );
  List<TaskEntities> taskList = [];
  List<TaskEntities> highPriorityTasks = [];
  List<TaskEntities> noHighPriorityTasks = [];
  List<TaskEntities> todoTask = [];
  List<TaskEntities> completedTask = [];






  Future<void> loadData() async {
      final tasks = await getTasksUseCase();
      taskList=tasks;
      highPriorityTasks=tasks.reversed
          .where((e) => e.highPriority)
          .toList();
      noHighPriorityTasks= tasks.reversed
          .where((e) => !e.highPriority)
          .toList();
    todoTask= tasks.reversed.where((e) => !e.isDone).toList();
    completedTask= tasks.reversed.where((e) => e.isDone).toList();
    notifyListeners();

  }

  Future<void> toggleMyTask(TaskEntities task, bool value) async {
    final updatedTask = TaskEntities(
      id: task.id,
      taskName: task.taskName,
      taskDescription: task.taskDescription,
      highPriority: task.highPriority,
      isDone: value,
    );

    await _editTaskUseCase.call(updatedTask);
    await loadData();
    notifyListeners();
  }

  Future<void> deleteTask(String id) async {


      await _deleteTaskUseCase.call(id);

      await loadData();

  }

  Future<void> editTask(TaskEntities task) async {


      await _editTaskUseCase.call(task);
      await loadData();

  }


}
