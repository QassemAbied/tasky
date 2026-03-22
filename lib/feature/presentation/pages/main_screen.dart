import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:tasky/core/helper/extension.dart';
import 'package:tasky/core/theme/app_colors.dart';
import 'package:tasky/feature/presentation/controller/main_controller/main_provider.dart';
import 'package:tasky/feature/presentation/pages/complet_task/view/completed_screen.dart';
import 'package:tasky/feature/presentation/pages/home/view/home_screen.dart';
import 'package:tasky/feature/presentation/pages/profile/view/profile_screen.dart';
import 'package:tasky/feature/presentation/pages/todo/view/todo_screen.dart';

class MainScreen extends StatelessWidget {
  const  MainScreen({super.key});


  static int currentIndex=0;
 static final  List<Widget> screens = [
    const HomeScreen(),
    const TodoScreen(),
    const CompletedScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<MainProvider>(
      builder: (BuildContext context, MainProvider value, Widget? child) {
        currentIndex= value.currentIndex;
        return Scaffold(
          body: screens[value.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.shifting,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: context.textSecondary,
            showUnselectedLabels: true,
            currentIndex: value.currentIndex,
            onTap: (vale) {
              context.read<MainProvider>().changeBottomNavBar(vale);
            },
            items: [

              BottomNavigationBarItem(

                icon: buildSvgColor(
                  image: 'assets/svgs/home_icon.svg', index: 0,
                  context: context,

                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: buildSvgColor(
                  image: 'assets/svgs/todo_icon.svg', index: 1,
                  context: context,
                ),
                label: 'Todo',

              ),
              BottomNavigationBarItem(
                icon: buildSvgColor(
                  image: 'assets/svgs/complet_icon.svg',
                  index: 2,
                  context: context,
                ),
                label: 'Completed',
              ),
              BottomNavigationBarItem(
                icon: buildSvgColor(
                  image: 'assets/svgs/profile_icon.svg',
                  index: 3,
                  context: context,
                ),
                label: 'Profile',
              ),
            ],
          ),
        );
      },);



  }
  Widget buildSvgColor({required String image, required int index, required BuildContext context}) {
    return SvgPicture.asset(
      image,
      colorFilter: ColorFilter.mode(
        currentIndex == index ? AppColors.primaryColor : context.textSecondary,
        BlendMode.srcIn,
      ),
    );
  }

}
