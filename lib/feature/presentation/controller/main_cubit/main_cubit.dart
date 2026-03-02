

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());

  static MainCubit get(BuildContext context)=>BlocProvider.of(context);
  int currentIndex=0;
  void changeBottomNavBar(int index){
    currentIndex =index;
    emit(ChangeBottomNavBar());
  }
}
