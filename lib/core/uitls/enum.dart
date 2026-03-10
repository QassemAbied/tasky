enum ThemeModeEnum{
  system,
  dark,
  light,
}


enum TaskItemActionsEnum{
  mark(name: 'Mark As Done'),
  delete(name:'Delete'),
  edit(name:'Edit');

  final String name;
  const TaskItemActionsEnum({required this.name});
}