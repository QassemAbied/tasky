class TaskEntities {
  final String id;
  final String taskName;
  final String taskDescription;
  final bool highPriority;
  bool isDone;

  TaskEntities({
    String? id,
    required this.taskName,
    required this.taskDescription,
    required this.highPriority,
    this.isDone=false,
  }): id = id ?? DateTime.now().millisecondsSinceEpoch.toString();

  
}