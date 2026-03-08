import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/constants/app_constants.dart';
import 'package:tasky/core/helper/extension.dart';
import 'package:tasky/core/helper/shared_pref.dart';
import 'package:tasky/core/helper/spacing.dart';
import 'package:tasky/core/routing/routers.dart';
import 'package:tasky/core/theme/app_text_style.dart';
import 'package:tasky/feature/presentation/controller/user_details/user_details_cubit.dart';
import 'package:tasky/feature/presentation/controller/user_details/user_details_state.dart';
import 'package:tasky/feature/presentation/pages/profile/view/user_details.dart';
import 'package:tasky/feature/presentation/pages/profile/view/widget/build_list_title.dart';
import 'package:tasky/feature/presentation/pages/profile/view/widget/bulid_change_theme_list_title.dart';

class ProfileScreen extends StatelessWidget {
   ProfileScreen({super.key});

  late String userName;
  late String quote;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Profile')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 55,
                        backgroundImage: AssetImage(
                          'assets/images/image_avater.png',
                        ),
                        backgroundColor: Colors.transparent,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: GestureDetector(
                          onTap: () {},
                          child: CircleAvatar(
                            radius: 20,
                            backgroundColor: context.textSurface,
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: context.textPrimary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(10),
                  BlocBuilder<UserDetailsCubit, UserDetailsState>(
                    builder: (context, state) {
                      userName=state.userName;
                      quote= state.quote;
                      return Column(
                        children: [
                          FittedBox(
                            child: Text(
                             state.userName,
                              style: AppTextStyle.regular(
                                fontSize: 20,
                                color: context.textPrimary,
                              ),
                            ),
                          ),
                          verticalSpace(5.0),
                          Text(
                            state.quote,
                            style: AppTextStyle.regular(
                              fontSize: 14,
                              color: context.textSecondary,
                            ),
                          ),
                        ],
                      );
                    },
                  ),


                ],
              ),
            ),

            verticalSpace(20.0),
            Text(
              'Profile Info',
              style: AppTextStyle.regular(
                fontSize: 20,
                color: context.textPrimary,
              ),
            ),
            verticalSpace(20.0),
            BuildListTitle(
              image: 'assets/svgs/profile_icon.svg',
              title: 'User Details',
              trailing: Icon(Icons.arrow_forward_rounded),
              onTap: () {
                context.pushNamed(Routers.userDetailsScreen,arguments: {
                  'userName':userName,
                  'quote':quote,
                });

              },
            ),

            Divider(),
            BuildChangeThemeListTitle(),
            Divider(),
            BuildListTitle(
              image: 'assets/svgs/logout_icon.svg',
              title: 'Log Out',
              trailing: Icon(Icons.arrow_forward_rounded),
              onTap: () async{
                context.read<UserDetailsCubit>().logout();
                context.pushReplacementNamed(Routers.onBoardingScreen);
              },
            ),
          ],
        ),
      ),
    );
  }
}
