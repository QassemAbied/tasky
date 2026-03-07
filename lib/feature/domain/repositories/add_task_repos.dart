import 'package:tasky/feature/domain/entities/task_entities.dart';

abstract class TaskRepos {
  Future<TaskEntities> addTask(TaskEntities task);
  Future<List<TaskEntities>> getTask();
  Future<void> updateTask(List<TaskEntities> task);
  Future addUserName(String userName);
  String? getUserName();

  Future addQuoteUser(String quote);
  String? getQuoteUser();
  Future logOut();
}
