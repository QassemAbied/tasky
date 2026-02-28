import '../../../domain/entities/task_entities.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState {
  final HomeStatus status;
  final List<TaskEntities> tasks;
  final String? error;


  const HomeState({
    this.status = HomeStatus.initial,
    this.tasks = const [],
    this.error,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<TaskEntities>? tasks,
    String? error,

  }) {
    return HomeState(
      status: status ?? this.status,
      tasks: tasks ?? this.tasks,
      error: error ?? this.error,

    );
  }
}