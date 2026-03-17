import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/theme/theme_controller/theme_cubit.dart';
import 'package:tasky/feature/presentation/controller/add_task_controller/add_task_provider.dart';
import 'package:tasky/feature/presentation/controller/main_cubit/main_cubit.dart';
import 'package:tasky/feature/presentation/controller/user_details/user_details_cubit.dart';
import 'core/helper/shared_pref.dart';
import 'core/uitls/di.dart';
import 'feature/presentation/controller/home_controller/home_provider.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await SharedPrefHelper.init();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => MainCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
        BlocProvider(
          create: (context) => sl<UserDetailsCubit>()..getUserDetails()..getImage(),
        ),

      ],
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>sl<HomeProvider>()..loadData()),

          ],
      child: const MyApp()),
    ),
  );
}
