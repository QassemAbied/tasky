import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/feature/domain/usecases/get_task_usecase.dart';
import '../../../domain/entities/task_entities.dart';
import '../../../domain/usecases/update_task_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetTaskUseCase getTasksUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  HomeCubit(this.getTasksUseCase, this._updateTaskUseCase)
    : super(const HomeState()){
    loadData();
  }

  Future<void> toggleMyTask(TaskEntities task, bool value) async {
    final updatedTasks = List<TaskEntities>.from(state.tasks);
    final realIndex = updatedTasks.indexWhere(
      (e) => e.taskName == task.taskName,
    );

    if (realIndex == -1) return;

    final oldTask = updatedTasks[realIndex];

    updatedTasks[realIndex] = TaskEntities(
      taskName: oldTask.taskName,
      taskDescription: oldTask.taskDescription,
      highPriority: oldTask.highPriority,
      isDone: value,
    );

    emit(state.copyWith(
      tasks: updatedTasks,

      highPriorityTasks:
      updatedTasks.where((e) => e.highPriority).toList(),

      noHighPriorityTasks:
      updatedTasks.where((e) => !e.highPriority).toList(),
        todoTask: updatedTasks.where((e)=>!e.isDone).toList(),
    ));
    await _updateTaskUseCase.call(updatedTasks);
  }

  Future<void> loadData() async {
    emit(state.copyWith(
      status: HomeStatus.loading,
      todoStatus: TodoStatus.loading,
    ));
    try {

      final tasks = await getTasksUseCase();
      emit(state.copyWith(

        highPriority: HighPriority.loaded,
        noHighPriority: NoHighPriority.loaded,
          status: HomeStatus.loaded,
        todoStatus: TodoStatus.loaded,
        tasks: tasks,
        highPriorityTasks: tasks.where((e) => e.highPriority).toList(),
        noHighPriorityTasks: tasks.where((e) => !e.highPriority).toList(),
        todoTask: tasks.where((e)=>!e.isDone).toList()
      ));
    } catch (e) {
      emit(state.copyWith(
        status: HomeStatus.error,
        highPriority: HighPriority.error,
        noHighPriority: NoHighPriority.error,
        todoStatus: TodoStatus.error,
        error: e.toString(),
      ));
    }
  }
  // Future<void> getAllTasks() async {
  //   emit(state.copyWith(status: HomeStatus.loading));
  //
  //   try {
  //     final tasks = await getTasksUseCase();
  //
  //     emit(
  //         state.copyWith(
  //             status: HomeStatus.loaded,
  //             tasks: tasks));
  //
  //   } catch (e) {
  //     emit(state.copyWith(status: HomeStatus.error, error: e.toString()));
  //   }
  // }

  // Future<void> getHighPriorityTasks() async {
  //   emit(state.copyWith(highPriority: HighPriority.loading));
  //
  //   try {
  //     final tasks = await getTasksUseCase();
  //
  //     emit(
  //         state.copyWith(
  //             highPriority: HighPriority.loaded,
  //             highPriorityTasks: tasks.where((task) => task.highPriority==true).toList()));
  //
  //   } catch (e) {
  //     emit(state.copyWith(highPriority: HighPriority.error, error: e.toString()));
  //   }
  // }
  // // List<TaskEntities> get highPriorityTasks =>
  // //     state.tasks.where((task) => task.highPriority).toList();
  //
  // Future<void> getNoHighPriorityTasks() async {
  //   emit(state.copyWith(noHighPriority: NoHighPriority.loading));
  //
  //   try {
  //     final tasks = await getTasksUseCase();
  //
  //     emit(
  //         state.copyWith(
  //             noHighPriority: NoHighPriority.loaded,
  //             noHighPriorityTasks: tasks.where((e) => e.highPriority == false).toList()));
  //
  //   } catch (e) {
  //     emit(state.copyWith(noHighPriority: NoHighPriority.error, error: e.toString()));
  //   }
  // }
  // // List<TaskEntities> get noHighPriorityTasks =>
  // //     state.tasks.where((e) => e.highPriority == false).toList();
  //
  //
  // Future<void> getNoCompletedTask()async{
  //   emit(state.copyWith(status: HomeStatus.loading));
  //
  //   try {
  //     final tasks = await getTasksUseCase();
  //
  //     emit(state.copyWith(status: HomeStatus.loaded,
  //         tasks: tasks.where((e) => e.isDone==true ).toList()));
  //
  //   } catch (e) {
  //     emit(state.copyWith(status: HomeStatus.error, error: e.toString()));
  //   }
  // }

}
