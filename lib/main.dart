import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/theme/theme_controller/theme_cubit.dart';
import 'package:tasky/feature/presentation/controller/add_task_cubit/add_new_task_cubit.dart';
import 'package:tasky/feature/presentation/controller/main_cubit/main_cubit.dart';
import 'package:tasky/feature/presentation/controller/user_details/user_details_cubit.dart';
import 'core/helper/shared_pref.dart';
import 'core/uitls/di.dart';
import 'feature/presentation/controller/home_cubit/home_cubit.dart';
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
          create: (context) => sl<UserDetailsCubit>()..getUserDetails(),
        ),
        BlocProvider(
          create: (context) => sl<AddNewTaskCubit>(),
        ),
        BlocProvider.value(value: sl<HomeCubit>()),
      ],
      child: const MyApp(),
    ),
  );
}
