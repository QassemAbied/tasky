import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/feature/domain/usecases/get_task_usecase.dart';
import '../../../domain/entities/task_entities.dart';
import '../../../domain/usecases/update_task_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetTaskUseCase getTasksUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  HomeCubit(this.getTasksUseCase, this._updateTaskUseCase)
    : super(const HomeState());

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

    emit(state.copyWith(tasks: updatedTasks));
    await _updateTaskUseCase.call(updatedTasks);
  }

  Future<void> getTasks() async {
    emit(state.copyWith(status: HomeStatus.loading));

    try {
      final tasks = await getTasksUseCase();

      emit(state.copyWith(status: HomeStatus.loaded));
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error, error: e.toString()));
    }
  }

  List<TaskEntities> get highPriorityTasks =>
      state.tasks.where((task) => task.highPriority).toList();

  List<TaskEntities> get noHighPriorityTasks =>
      state.tasks.where((e) => e.highPriority == false).toList();
}
