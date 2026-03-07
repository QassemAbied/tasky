import '../repositories/add_task_repos.dart';

class GetQuoteUseCase {
  final TaskRepos taskRepos;

  GetQuoteUseCase(this.taskRepos);
  String? call() {
    return taskRepos.getQuoteUser();
  }
}
