import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/helper/extension.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theme/app_text_style.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset('assets/svgs/logo_tasky.svg',),
        horizontalSpace(20),
        Text(
          'Tasky',
          style: AppTextStyle.regular(
            fontSize: 28,
            color: context.textPrimary,
          ),
        ),
      ],
    );
  }
}
