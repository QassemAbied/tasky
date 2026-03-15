import 'package:tasky/feature/domain/repositories/add_task_repos.dart';

class GetImageUseCase {
  final TaskRepos taskRepos;

  GetImageUseCase(this.taskRepos);
  Future call()async{
    return await taskRepos.getImage();
  }

}