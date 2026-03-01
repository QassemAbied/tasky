import '../../../domain/entities/task_entities.dart';

enum HomeStatus { initial, loading, loaded, error }

enum HighPriority { initial, loading, loaded, error }

enum NoHighPriority { initial, loading, loaded, error }
enum TodoStatus { initial, loading, loaded, error }

class HomeState {
  final HomeStatus status;
  final HighPriority highPriority;
  final NoHighPriority noHighPriority;

  final List<TaskEntities> tasks;
  final List<TaskEntities> highPriorityTasks;
  final List<TaskEntities> noHighPriorityTasks;
  final String? error;
  final TodoStatus todoStatus;
  final List<TaskEntities> todoTask;
  const HomeState({
    this.status = HomeStatus.initial,
    this.highPriority = HighPriority.initial,
    this.noHighPriority = NoHighPriority.initial,
    this.todoStatus = TodoStatus.initial,
    this.todoTask = const [],
    this.tasks = const [],
    this.noHighPriorityTasks = const [],
    this.highPriorityTasks = const [],
    this.error,
  });

  HomeState copyWith({
    HomeStatus? status,
    HighPriority? highPriority,
    NoHighPriority? noHighPriority,
    List<TaskEntities>? tasks,
     List<TaskEntities>? highPriorityTasks,
     List<TaskEntities>? noHighPriorityTasks,
    String? error,
    TodoStatus? todoStatus,
    List<TaskEntities>? todoTask,
  }) {
    return HomeState(
      status: status ?? this.status,
      highPriority: highPriority ?? this.highPriority,
      noHighPriority: noHighPriority ?? this.noHighPriority,
      tasks: tasks ?? this.tasks,
      highPriorityTasks: highPriorityTasks ?? this.highPriorityTasks,
      noHighPriorityTasks: noHighPriorityTasks ?? this.noHighPriorityTasks,
      error: error ?? this.error,
      todoStatus: todoStatus ?? this.todoStatus,
      todoTask: todoTask ?? this.todoTask,
    );
  }
}
