import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/theme/theme_controller/theme_provider.dart';
import 'core/constants/app_constants.dart';
import 'core/helper/shared_pref.dart';
import 'core/routing/router_app.dart';
import 'core/routing/routers.dart';
import 'core/theme/app_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (
        BuildContext context, ThemeProvider value, Widget? child) {
      final isOnBoard=isOnBoarding();
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tasky',
        theme: AppTheme.light(),
        darkTheme: AppTheme.dark(),
        themeMode: value.themeMode(),
        onGenerateRoute: RouterApp.generateRoute,
        initialRoute:isOnBoard==true?Routers.mainScreen:Routers.onBoardingScreen,
      );
    },);

  }
   bool? isOnBoarding(){
    return SharedPrefHelper.getBool(key: AppConstants.onBoardingKey);
  }
}
