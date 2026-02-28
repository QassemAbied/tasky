class TaskEntities {
  final String taskName;
  final String taskDescription;
  final bool highPriority;
  bool isDone;

  TaskEntities({
    required this.taskName,
    required this.taskDescription,
    required this.highPriority,
    this.isDone=false,
  });

  
}