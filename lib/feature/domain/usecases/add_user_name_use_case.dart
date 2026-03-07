import '../repositories/add_task_repos.dart';

// class AddUserNameUseCase {
//   final TaskRepos taskRepos;
//
//   AddUserNameUseCase(this.taskRepos);
//   Future<void> call(String userName) async {
//     return await taskRepos.saveUserName(userName);
//   }
// }

class AddUserNameUseCase {
  final TaskRepos taskRepos;

  AddUserNameUseCase(this.taskRepos);

  Future<void> call(String userName) async {
    await taskRepos.addUserName(userName);
  }
}
