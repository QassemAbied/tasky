import 'package:flutter/material.dart';
import 'package:tasky/core/constants/app_constants.dart';
import 'package:tasky/core/helper/shared_pref.dart';
import 'package:tasky/core/theme/app_colors.dart';
import 'package:tasky/core/theme/app_text_style.dart';
import '../../../../../../core/common_widgets/text_field.dart';
import '../../../../../../core/helper/spacing.dart';
import '../../../home/view/home_screen.dart';


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
                  await SharedPrefHelper.setData(
                      key: AppConstants.nameKey, value: controller.text
                  );
                  Navigator.push( context, MaterialPageRoute(builder: (BuildContext context)=>HomeScreen()));
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
