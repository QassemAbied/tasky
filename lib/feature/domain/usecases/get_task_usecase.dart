import 'package:tasky/feature/domain/entities/task_entities.dart';
import 'package:tasky/feature/domain/repositories/add_task_repos.dart';

class GetTaskUseCase {
  final TaskRepos taskRepos;

  GetTaskUseCase(this.taskRepos);
  Future<List<TaskEntities>> call()async{
    return await taskRepos.getTask();
  }
}