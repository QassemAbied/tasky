enum ThemeModeEnum{
  system,
  dark,
  light,
}


enum TaskItemActionsEnum{
  mark(name: 'Mark As Done'),
  edit(name:'Edit'),
  delete(name:'Delete');
  final String name;
  const TaskItemActionsEnum({required this.name});
}