import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/feature/domain/usecases/delete_task_usecase.dart';
import 'package:tasky/feature/domain/usecases/edit_task_usecase.dart';
import 'package:tasky/feature/domain/usecases/get_task_usecase.dart';
import '../../../domain/entities/task_entities.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetTaskUseCase getTasksUseCase;
  final DeleteTaskUseCase _deleteTaskUseCase;
  final EditTaskUseCase _editTaskUseCase;
  HomeCubit(
    this.getTasksUseCase,
    this._deleteTaskUseCase,
    this._editTaskUseCase,
  ) : super(const HomeState()) {
    loadData();
  }
  Future<void> editTask(TaskEntities task) async {
    try {

      await _editTaskUseCase.call(task);

      await loadData();
    } catch (e) {
      emit(state.copyWith(status: HomeStatus.error, error: e.toString()));
    }
  }

  Future<void> deleteTask(String id) async {
    try {

      await _deleteTaskUseCase.call(id);

      await loadData();

      emit(state.copyWith(deleteStatus: DeleteStatus.loaded));
    } catch (e) {
      emit(
        state.copyWith(deleteStatus: DeleteStatus.error, error: e.toString()),
      );
    }
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
          highPriorityTasks: tasks.reversed
              .where((e) => e.highPriority)
              .toList(),
          noHighPriorityTasks: tasks.reversed
              .where((e) => !e.highPriority)
              .toList(),
          todoTask: tasks.reversed.where((e) => !e.isDone).toList(),
          completedTask: tasks.reversed.where((e) => e.isDone).toList(),
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
