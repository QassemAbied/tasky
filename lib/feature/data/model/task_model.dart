
import 'package:hive_ce_flutter/adapters.dart';

import '../../domain/entities/task_entities.dart';

part 'task_model.g.dart';

@HiveType(typeId: 0)
class TaskModel extends TaskEntities {

  @HiveField(0)
  final String id;

  @HiveField(1)
  final String taskName;

  @HiveField(2)
  final String taskDescription;

  @HiveField(3)
  final bool highPriority;

  @HiveField(4)
  bool isDone;

  TaskModel({
    required this.id,
    required this.taskName,
    required this.taskDescription,
    required this.highPriority,
    this.isDone = false,
  }) : super(
    id: id,
    taskName: taskName,
    taskDescription: taskDescription,
    highPriority: highPriority,
    isDone: isDone,
  );

}