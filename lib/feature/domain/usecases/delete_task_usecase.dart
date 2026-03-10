import 'package:tasky/feature/domain/repositories/add_task_repos.dart';

class DeleteTaskUseCase {
  final TaskRepos taskRepos;

  DeleteTaskUseCase(this.taskRepos);


  Future call(String id)async{
    return await taskRepos.deleteTask(id);
  }
}