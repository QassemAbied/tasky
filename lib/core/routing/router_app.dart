import 'package:flutter/material.dart';
import 'package:tasky/core/routing/routers.dart';
import 'package:tasky/feature/presentation/pages/add_task/view/add_task_screen.dart';
import 'package:tasky/feature/presentation/pages/main_screen.dart';
import 'package:tasky/feature/presentation/pages/on_boarding/view/on_boarding_screen.dart';
import 'package:tasky/feature/presentation/pages/profile/view/user_details.dart';

import '../../feature/presentation/pages/home/view/high_priority_Screen.dart';

class RouterApp {
static Route? generateRoute(RouteSettings settings){
  switch(settings.name){
    case Routers.highPriorityScreen:
      {
        return MaterialPageRoute(builder: (_)=>HighPriorityScreen());
      }
    case Routers.mainScreen:
      {
        return MaterialPageRoute(builder: (_)=>MainScreen());
      }
    case Routers.addTaskScreen:
      {
        return MaterialPageRoute(builder: (_)=>AddTaskScreen());
      }
    case Routers.userDetailsScreen:
      {
        final arg=settings.arguments as Map;
        return MaterialPageRoute(builder: (_)=>UserDetails(userName: arg['userName'],quote: arg['quote'],
            ),);
      }
    case Routers.onBoardingScreen:
      {
        return MaterialPageRoute(builder: (_)=>OnBoardingScreen());
      }
  }
  return null;
}
}