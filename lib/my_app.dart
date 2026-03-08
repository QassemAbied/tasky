import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/constants/app_constants.dart';
import 'core/helper/shared_pref.dart';
import 'core/routing/router_app.dart';
import 'core/routing/routers.dart';
import 'core/theme/app_theme.dart';
import 'core/theme/theme_controller/theme_cubit.dart';
import 'core/theme/theme_controller/theme_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        final isOnBoard=isOnBoarding();
        return MaterialApp(
          title: 'Tasky',
          theme: AppTheme.light(),
          darkTheme: AppTheme.dark(),
          themeMode: ThemeCubit.get(context).themeMode(),
          onGenerateRoute: RouterApp.generateRoute,
          initialRoute:isOnBoard==true?Routers.mainScreen:Routers.onBoardingScreen,
        );
      },
    );
  }
   bool? isOnBoarding(){
    return SharedPrefHelper.getBool(key: AppConstants.onBoardingKey);
  }
}
