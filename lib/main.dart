import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/theme/theme_controller/theme_cubit.dart';
import 'package:tasky/feature/presentation/controller/main_controller/main_provider.dart';
import 'package:tasky/feature/presentation/controller/user_details_controller/user_details_provider.dart';
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
       // BlocProvider(create: (context) => MainCubit()),
        BlocProvider(create: (context) => ThemeCubit()),


      ],
      child: MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_)=>sl<HomeProvider>()..loadData()),
            ChangeNotifierProvider(create: (_)=>sl<UserDetailsProvider>()..getUserDetails()..getImage()),
            ChangeNotifierProvider(create: (_)=>MainProvider()),


          ],
      child: const MyApp()),
    ),
  );
}
