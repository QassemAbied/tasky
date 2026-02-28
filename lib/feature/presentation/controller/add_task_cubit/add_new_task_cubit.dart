import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/feature/domain/entities/task_entities.dart';
import 'package:tasky/feature/domain/usecases/add_task_usecase.dart';
import 'add_new_task_state.dart';

class AddNewTaskCubit extends Cubit<AddNewTaskState> {
  final AddTaskUseCase _addTaskUseCase;
  AddNewTaskCubit(this._addTaskUseCase) : super(AddNewTaskInitial());
  static AddNewTaskCubit get(BuildContext context) =>
      BlocProvider.of<AddNewTaskCubit>(context);
  bool isSelected = false;
  void toggleHighPriority(bool value) {
    isSelected = value;
    emit(HighPriorityChanged(isSelected: value));
  }

  void addTaskLoad({required TaskEntities task}) async {
    emit(AddTaskLoading());

    final response = await _addTaskUseCase.call(task);
    emit(AddTaskSuccess(response));
  }
}
