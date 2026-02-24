import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tasky/core/helper/spacing.dart';
import 'package:tasky/core/theme/theme_controller/theme_cubit.dart';
import 'package:tasky/feature/on_boarding/view/widgets/custom_text.dart';
import 'package:tasky/feature/on_boarding/view/widgets/logo.dart';
import 'package:tasky/feature/on_boarding/view/widgets/text_filed_and_botton.dart';
import '../../../core/uitls/enum.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Logo(), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      context.read<ThemeCubit>().selectedThemeMode(
                        ThemeModeEnum.dark,
                      );

                    },
                    child: Text('dark'),
                  ),

                  TextButton(
                    onPressed: () {
                      context.read<ThemeCubit>().selectedThemeMode(
                        ThemeModeEnum.light,
                      );
                    },
                    child: Text('light'),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomText(text: 'Welcome To Tasky ', size: 24),
                  horizontalSpace(10),
                  SvgPicture.asset('assets/svgs/waving-hand.svg'),
                ],
              ),
              verticalSpace(10),
              CustomText(
                text: 'Your productivity journey starts here.',
                size: 16,
              ),
              verticalSpace(20),
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Image(
                  image: AssetImage('assets/images/onboarding.png.png'),
                ),
              ),
              verticalSpace(20),
              Align(
                alignment: Alignment.centerLeft,
                child: CustomText(text: 'Full Name', size: 16),
              ),
              TextFiledAndBotton(),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            ],
          ),
        ),
      ),
    );
  }
}
