import '../../../domain/entities/task_entities.dart';

enum HomeStatus { initial, loading, loaded, error }

enum HighPriority { initial, loading, loaded, error }

enum NoHighPriority { initial, loading, loaded, error }

enum TodoStatus { initial, loading, loaded, error }

enum CompletedStatus { initial, loading, loaded, error }

class HomeState {
  final HomeStatus status;
  final HighPriority highPriority;
  final NoHighPriority noHighPriority;
  final TodoStatus todoStatus;
  final CompletedStatus completedStatus;
  final List<TaskEntities> tasks;
  final List<TaskEntities> highPriorityTasks;
  final List<TaskEntities> noHighPriorityTasks;
  final List<TaskEntities> todoTask;
  final List<TaskEntities> completedTask;
  final String? error;

  const HomeState({
    this.status = HomeStatus.initial,
    this.highPriority = HighPriority.initial,
    this.noHighPriority = NoHighPriority.initial,
    this.todoStatus = TodoStatus.initial,
    this.completedStatus = CompletedStatus.initial,
    this.todoTask = const [],
    this.tasks = const [],
    this.noHighPriorityTasks = const [],
    this.highPriorityTasks = const [],
    this.completedTask = const [],
    this.error,
  });

  HomeState copyWith({
    HomeStatus? status,
    HighPriority? highPriority,
    NoHighPriority? noHighPriority,
    TodoStatus? todoStatus,
    CompletedStatus? completedStatus,
    List<TaskEntities>? tasks,
    List<TaskEntities>? highPriorityTasks,
    List<TaskEntities>? noHighPriorityTasks,
    List<TaskEntities>? todoTask,
    List<TaskEntities>? completedTask,
    String? error,
  }) {
    return HomeState(
      status: status ?? this.status,
      highPriority: highPriority ?? this.highPriority,
      noHighPriority: noHighPriority ?? this.noHighPriority,
      todoStatus: todoStatus ?? this.todoStatus,
      completedStatus: completedStatus ?? this.completedStatus,
      tasks: tasks ?? this.tasks,
      highPriorityTasks: highPriorityTasks ?? this.highPriorityTasks,
      noHighPriorityTasks: noHighPriorityTasks ?? this.noHighPriorityTasks,
      todoTask: todoTask ?? this.todoTask,
      completedTask: completedTask ?? this.completedTask,
      error: error ?? this.error,
    );
  }
}
