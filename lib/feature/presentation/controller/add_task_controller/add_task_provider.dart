import 'package:flutter/widgets.dart';

import '../../../domain/entities/task_entities.dart';
import '../../../domain/usecases/add_task_usecase.dart';

class AddTaskProvider with ChangeNotifier{
  final AddTaskUseCase _addTaskUseCase;

  AddTaskProvider(this._addTaskUseCase);


  bool isSelected = false;
  void toggleHighPriority(bool value) {
    isSelected = value;
    notifyListeners();
  }


  void addTaskLoad({required TaskEntities task}) async {


    await _addTaskUseCase.call(task);
    notifyListeners();
  }
}