import 'package:flutter/material.dart';
import '../../../../../../core/helper/extension.dart';
import '../../../../../../core/theme/app_text_style.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text, required this.size});
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: AppTextStyle.regular(
        fontSize: size,
        color: context.textPrimary,
      ),
    );
  }
}
