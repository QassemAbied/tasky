import '../../domain/entities/task_entities.dart';

class TaskModel extends TaskEntities {
  TaskModel({
    required super.taskName,
    required super.taskDescription,
    required super.highPriority,
    super.isDone,
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      taskName: json['taskName'],
      taskDescription: json['taskDescription'],
      highPriority: json['highPriority'],
        isDone:json['isDone']??false,
    );
  }

  Map<String, dynamic> toJson() => {
    "taskName": taskName,
    "taskDescription": taskDescription,
    "highPriority": highPriority,
    "isDone":isDone,
  };
}
