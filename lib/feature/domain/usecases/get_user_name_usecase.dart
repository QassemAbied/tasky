import '../repositories/add_task_repos.dart';

class GetUserNameUseCase {
  final TaskRepos taskRepos;

  GetUserNameUseCase(this.taskRepos);
  String? call() {
    return taskRepos.getUserName();
  }
}
