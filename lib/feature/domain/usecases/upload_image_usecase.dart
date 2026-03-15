import 'package:tasky/feature/domain/repositories/add_task_repos.dart';

class UploadImageUseCase {
  final TaskRepos taskRepos;

  UploadImageUseCase(this.taskRepos);
  Future call(String image)async{
    return await taskRepos.uploadImage(image);
  }

}