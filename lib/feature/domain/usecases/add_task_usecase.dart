import 'package:tasky/feature/domain/entities/task_entities.dart';
import 'package:tasky/feature/domain/repositories/add_task_repos.dart';

class AddTaskUseCase {
  final TaskRepos addTaskRepos;
  AddTaskUseCase(this.addTaskRepos);

  Future<TaskEntities> call(TaskEntities task)async{
   return await addTaskRepos.addTask(task);
  }
}