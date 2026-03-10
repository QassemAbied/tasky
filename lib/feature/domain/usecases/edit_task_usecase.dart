import 'package:tasky/feature/domain/entities/task_entities.dart';
import 'package:tasky/feature/domain/repositories/add_task_repos.dart';

class EditTaskUseCase {
  final TaskRepos taskRepos;

  EditTaskUseCase(this.taskRepos);

  Future<void> call(TaskEntities task) async {
    return await taskRepos.editTask(task);
  }
}
