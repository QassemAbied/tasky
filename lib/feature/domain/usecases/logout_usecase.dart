import 'package:tasky/feature/domain/repositories/add_task_repos.dart';

class LogoutUseCase {
  final TaskRepos taskRepos;

  LogoutUseCase(this.taskRepos);
  Future call()async{
    return await taskRepos.logOut();
  }
}