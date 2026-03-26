import 'package:flutter/material.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/constants/app_constants.dart';
import 'package:tasky/core/theme/theme_controller/theme_provider.dart';
import 'package:tasky/feature/data/model/task_model.dart';
import 'package:tasky/feature/presentation/controller/main_controller/main_provider.dart';
import 'package:tasky/feature/presentation/controller/user_details_controller/user_details_provider.dart';
import 'core/helper/shared_pref.dart';
import 'core/uitls/di.dart';
import 'feature/presentation/controller/home_controller/home_provider.dart';
import 'hive_registrar.g.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 await Hive.initFlutter();
  Hive.registerAdapters();
 await Hive.openBox<TaskModel>(AppConstants.noteCollection);
  await Hive.openBox(AppConstants.userBox);
  await init();
  await SharedPrefHelper.init();

  runApp(

      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>sl<HomeProvider>()..loadData()),
            ChangeNotifierProvider(create: (_)=>sl<UserDetailsProvider>()..getUserDetails()..getImage()),
            ChangeNotifierProvider(create: (_)=>MainProvider()),
            ChangeNotifierProvider(create: (_)=>ThemeProvider()..saveThemeData()),


          ],
      child: const MyApp()),
    );
}
