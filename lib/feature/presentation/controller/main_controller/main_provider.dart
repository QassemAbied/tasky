import 'package:flutter/widgets.dart';

class MainProvider with ChangeNotifier{

  int currentIndex=0;
  void changeBottomNavBar(int index){
    currentIndex =index;
   notifyListeners();
  }

}