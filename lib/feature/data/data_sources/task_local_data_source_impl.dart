import 'dart:convert';

import 'package:tasky/core/constants/app_constants.dart';
import 'package:tasky/core/helper/shared_pref.dart';
import 'package:tasky/feature/data/data_sources/task_local_data_source.dart';
import 'package:tasky/feature/data/model/task_model.dart';

import '../../domain/entities/task_entities.dart';

class TaskLocalDataSourceImpl implements TaskLocalDataSource {
  @override
  Future<TaskModel> addTask(TaskModel task) async {
    final getTask = SharedPrefHelper.getString(key: AppConstants.addTaskKey);
    List listTask = [];
    if (getTask != null) {
      listTask = jsonDecode(getTask);
    }
    listTask.add(task.toJson());
    final taskEncode = jsonEncode(listTask);
    await SharedPrefHelper.setData(
      key: AppConstants.addTaskKey,
      value: taskEncode,
    );
    return task;
  }

  @override
  Future<List<TaskModel>> getTask() async{
  final getTasks= SharedPrefHelper.getString(key: AppConstants.addTaskKey);
  if(getTasks !=null) {
    final taskDecode= jsonDecode(getTasks)  ;
    return taskDecode.map<TaskModel>((e)=>TaskModel.fromJson(e)).toList();
  }
 return [];

  }

  @override
  Future<void> updateTask(List<TaskModel> task)async {

    final data= task.map((e)=>e.toJson()).toList();
    await SharedPrefHelper.setData(
      key: AppConstants.addTaskKey,
      value: jsonEncode(data),
    );


  }


}
