import '../entities/task_entities.dart';
import '../repositories/add_task_repos.dart';

class UpdateTaskUseCase {
  final TaskRepos updateTaskRepos;
  UpdateTaskUseCase(this.updateTaskRepos);

  Future<void> call(List<TaskEntities> task)async{
    return await updateTaskRepos.updateTask(task);
  }
}