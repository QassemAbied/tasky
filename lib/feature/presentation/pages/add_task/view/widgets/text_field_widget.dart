import 'package:flutter/material.dart';
import '../../../../../../core/common_widgets/text_field.dart';
import '../../../../../../core/helper/extension.dart';
import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/theme/app_text_style.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({
    super.key,
    required this.nameTaskController,
    required this.descriptionTaskController,
  });
  final TextEditingController nameTaskController;
  final TextEditingController descriptionTaskController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(15.0),
        AppTextFiled(
          controller: nameTaskController,
          hintText: 'Finish UI design for login screen',
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please Enter Your Task Name';
            }
            return null;
          },
        ),
        verticalSpace(15.0),
        Text(
          'Task Description',
          style: AppTextStyle.regular(fontSize: 16, color: context.textPrimary),
        ),
        verticalSpace(15.0),
        AppTextFiled(
          controller: descriptionTaskController,
          minLines: 8,
          maxLines: 12,
          hintText: 'Finish onboarding UI and hand off to devs by Thursday.',
          validator: (String? p1) {  },
          // validator: (String? value) {
          //   if (value == null || value.isEmpty) {
          //     return 'Please Enter Your Task Description';
          //   }
          //   return null;
          // },
        ),
        verticalSpace(15.0),
      ],
    );
  }
}
