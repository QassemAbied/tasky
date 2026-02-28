import 'package:tasky/feature/data/model/task_model.dart';

abstract class TaskLocalDataSource {
  Future<TaskModel> addTask(TaskModel task);
  Future<List<TaskModel>> getTask();
  Future<void> updateTask(List<TaskModel> task);
}