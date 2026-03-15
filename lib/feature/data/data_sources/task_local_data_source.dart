import 'dart:ffi';

import 'package:tasky/feature/data/model/task_model.dart';

abstract class TaskLocalDataSource {
  Future<TaskModel> addTask(TaskModel task);
  Future<List<TaskModel>> getTask();
  Future addUserName(String userName);
  String? getUserName();


  Future addQuoteUser(String quote);
  String? getQuoteUser();
  Future logOut();
  Future deleteTask(String id);
  Future<void> editTask(TaskModel task);
  Future uploadImage(String image);
  Future getImage();
}