import '../repositories/add_task_repos.dart';

class AddQuoteUseCase {
  final TaskRepos taskRepos;

  AddQuoteUseCase(this.taskRepos);

  Future<void> call(String quote) async {
    await taskRepos.addQuoteUser(quote);
  }
}