import 'package:tasky/feature/data/data_sources/task_local_data_source.dart';
import 'package:tasky/feature/domain/entities/task_entities.dart';
import 'package:tasky/feature/domain/repositories/add_task_repos.dart';

import '../model/task_model.dart';

class AddTaskReposImpl implements TaskRepos{
  final TaskLocalDataSource taskLocalDataSource;

  AddTaskReposImpl(this.taskLocalDataSource);
  @override
  Future<TaskEntities> addTask(TaskEntities task) async{
    final model = TaskModel(
      id: task.id,
        taskName: task.taskName,
        taskDescription: task.taskDescription,
        highPriority: task.highPriority

    );
    return await taskLocalDataSource.addTask(model);
  }

  @override
  Future<List<TaskEntities>> getTask() async{
   return await taskLocalDataSource.getTask();
  }



  @override
  String? getUserName() {
   return taskLocalDataSource.getUserName();
  }

  @override
  Future addUserName(String userName) async{
    return await taskLocalDataSource.addUserName(userName);
  }

  @override
  Future<dynamic> addQuoteUser(String quote)async {
    return await taskLocalDataSource.addQuoteUser(quote);
  }

  @override
  String? getQuoteUser() {
    return taskLocalDataSource.getQuoteUser();
  }

  @override
  Future<dynamic> logOut()async {
    return await taskLocalDataSource.logOut();
  }

  @override
  Future<dynamic> deleteTask(String id)async {
   return await taskLocalDataSource.deleteTask(id);
  }

  @override
  Future<void> editTask(TaskEntities task)async {
    final model = TaskModel(
      isDone: task.isDone,
        id: task.id,
        taskName: task.taskName,
        taskDescription: task.taskDescription,
        highPriority: task.highPriority

    );
    return await taskLocalDataSource.editTask(model);
  }

  @override
  Future<dynamic> getImage() async{
   return await taskLocalDataSource.getImage();
  }

  @override
  Future<dynamic> uploadImage(String image)async {
    return await taskLocalDataSource.uploadImage(image);
  }
}