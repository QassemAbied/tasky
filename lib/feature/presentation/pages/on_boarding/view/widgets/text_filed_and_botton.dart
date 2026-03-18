import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/constants/app_constants.dart';
import 'package:tasky/core/helper/shared_pref.dart';
import 'package:tasky/core/theme/app_colors.dart';
import 'package:tasky/core/theme/app_text_style.dart';
import '../../../../../../core/common_widgets/text_field.dart';
import '../../../../../../core/helper/extension.dart';
import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/routing/routers.dart';
import '../../../../controller/user_details_controller/user_details_provider.dart';


class TextFiledAndBotton extends StatefulWidget {
  const TextFiledAndBotton({super.key});

  @override
  State<TextFiledAndBotton> createState() => _TextFiledAndBottonState();
}

class _TextFiledAndBottonState extends State<TextFiledAndBotton> {
  final TextEditingController controller = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          verticalSpace(20),
          AppTextFiled(
            controller: controller,
            hintText: 'e.g. Sarah Khalid',
            minLines: 1,
            maxLines: 2,
            validator: (String? value) {
              if (value==null||value.trim().isEmpty) {
                return 'Please Enter Your Name';
              }
              return null;
            },
          ),
          verticalSpace(20),
          SizedBox(
            height: 50,
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () async{
                if (formKey.currentState?.validate()??false) {
                  context.read<UserDetailsProvider>().addUserDetails(controller.text,'One task at a time.One step\n closer.');

                  context.pushNamedAndRemoveUntil(Routers.mainScreen);
                  await SharedPrefHelper.setData(
                      key: AppConstants.onBoardingKey, value: true);
                }else{
                  snackBar();
                }

              },
              child: Text('Let’s Get Started'),
            ),
          ),
        ],
      ),
    );
  }

  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> snackBar() {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.only(top: 20, right: 10, bottom: 20, left: 10),
        padding: EdgeInsets.all(8.0),
        backgroundColor: AppColors.primaryColor,
        content: Text(
          'Please Enter Your Name',
          style: AppTextStyle.medium(
            fontSize: 20,
            color: AppColors.bgColorLight,
          ),
        ),
      ),
    );
  }
}
