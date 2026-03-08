import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../core/helper/extension.dart';
import '../../../../../../core/theme/app_text_style.dart';

class BuildListTitle extends StatelessWidget {
  const BuildListTitle({
    super.key,
    required this.onTap,
    required this.image,
    required this.title,
    required this.trailing,
  });
  final Function onTap;
  final String image;
  final String title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap:()=> onTap(),
      leading: SvgPicture.asset(
        image,
        colorFilter: ColorFilter.mode(context.textPrimary, BlendMode.srcIn),
      ),
      title: Text(
        title,
        style: AppTextStyle.regular(fontSize: 16, color: context.textPrimary),
      ),
      trailing: trailing,
    );
  }
}
