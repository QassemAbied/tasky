import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../../core/helper/extension.dart';
import '../../../../../../core/helper/spacing.dart';
import '../../../../../../core/theme/app_text_style.dart';

class TextWelcomeWidget extends StatelessWidget {
  const TextWelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        verticalSpace(15.0),
        Text(
          'Yuhuu ,Your work Is ',
          style: AppTextStyle.regular(
            fontSize: 32,
            color: context.textSecondary,
          ),
        ),
        Row(
          children: [
            Text(
              'almost done !',
              style: AppTextStyle.regular(
                fontSize: 32,
                color: context.textSecondary,
              ),
            ),
            SvgPicture.asset('assets/svgs/waving-hand.svg'),
          ],
        ),
        verticalSpace(15.0),
      ],
    );
  }
}
