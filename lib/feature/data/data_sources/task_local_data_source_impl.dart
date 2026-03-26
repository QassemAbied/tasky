

import 'package:hive_ce_flutter/adapters.dart';
import 'package:tasky/core/constants/app_constants.dart';
import 'package:tasky/feature/data/data_sources/task_local_data_source.dart';
import 'package:tasky/feature/data/model/task_model.dart';

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  final Box<TaskModel> taskBox = Hive.box<TaskModel>(AppConstants.noteCollection);

  @override
  Future<TaskModel> addTask(TaskModel task) async {
    await taskBox.put(task.id, task);
    return task;
  }

  @override
  Future<List<TaskModel>> getTask() async {
    return taskBox.values.toList();
  }

  @override
  Future deleteTask(String id) async {
    await taskBox.delete(id);
  }

  @override
  Future<void> editTask(TaskModel task) async {
    await taskBox.put(task.id, task);
  }


  final Box userBox = Hive.box(AppConstants.userBox);

  @override
  String? getUserName() {
    return userBox.get(AppConstants.userNameKey);
  }

  @override
  Future addUserName(String userName) async {
    await userBox.put(AppConstants.userNameKey, userName);
  }

  @override
  Future addQuoteUser(String quote) async {
    await userBox.put(AppConstants.quoteKey, quote);
  }

  @override
  String? getQuoteUser() {
    return userBox.get(AppConstants.quoteKey);
  }

  @override
  Future getImage() async {
    return userBox.get(AppConstants.imageUser);
  }

  @override
  Future uploadImage(String image) async {
    await userBox.put(AppConstants.imageUser, image);
  }

  @override
  Future logOut() async {
    await taskBox.clear();
    await userBox.clear();
  }
}