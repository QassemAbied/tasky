import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/feature/domain/usecases/get_task_usecase.dart';
import '../../../domain/entities/task_entities.dart';
import '../../../domain/usecases/update_task_usecase.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetTaskUseCase getTasksUseCase;
  final UpdateTaskUseCase _updateTaskUseCase;
  HomeCubit(this.getTasksUseCase, this._updateTaskUseCase)
    : super(const HomeState()) {
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

    emit(
      state.copyWith(
        tasks: updatedTasks,
        highPriorityTasks: updatedTasks.where((e) => e.highPriority).toList(),
        noHighPriorityTasks: updatedTasks
            .where((e) => !e.highPriority)
            .toList(),
        todoTask: updatedTasks.where((e) => !e.isDone).toList(),
        completedTask: updatedTasks.where((e) => e.isDone).toList(),
      ),
    );
    await _updateTaskUseCase.call(updatedTasks);
  }

  Future<void> loadData() async {
    emit(
      state.copyWith(
        status: HomeStatus.loading,
        todoStatus: TodoStatus.loading,
        completedStatus: CompletedStatus.loading,
      ),
    );
    try {
      final tasks = await getTasksUseCase();
      emit(
        state.copyWith(
          highPriority: HighPriority.loaded,
          noHighPriority: NoHighPriority.loaded,
          status: HomeStatus.loaded,
          todoStatus: TodoStatus.loaded,
          completedStatus: CompletedStatus.loaded,
          tasks: tasks,
          highPriorityTasks: tasks.where((e) => e.highPriority).toList(),
          noHighPriorityTasks: tasks.where((e) => !e.highPriority).toList(),
          todoTask: tasks.where((e) => !e.isDone).toList(),
          completedTask: tasks.where((e) => e.isDone).toList(),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: HomeStatus.error,
          highPriority: HighPriority.error,
          noHighPriority: NoHighPriority.error,
          todoStatus: TodoStatus.error,
          completedStatus: CompletedStatus.error,
          error: e.toString(),
        ),
      );
    }
  }
}
