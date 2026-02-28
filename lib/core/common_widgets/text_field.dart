import 'package:flutter/material.dart';
import 'package:tasky/core/helper/extension.dart';
import 'package:tasky/core/theme/app_text_style.dart';

import '../theme/app_colors.dart';

class AppTextFiled extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final int? minLines;
  final int? maxLines;
  final String? prefixIcon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final Widget? suffix;
  final bool? enabled;
  final bool? isPassword;
  final Function(String?) validator;
  final bool? enable;
  final String? helperText;
  const AppTextFiled({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.textInputType,
    this.controller,
    this.suffix,
    this.isPassword,
    required this.validator,
    this.enable,
    this.helperText,
    this.labelText,
    this.enabled, this.minLines, this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: enable ?? false,
      keyboardType: textInputType,
      controller: controller,
      maxLines: maxLines,
      minLines:minLines ,
      obscureText: isPassword ?? false,
      decoration: InputDecoration(
        enabled: enabled ?? true,
        helperText: helperText,
        labelText: labelText,
        isDense: true,
        filled: true,
        fillColor: context.textSurface,
        contentPadding: EdgeInsets.symmetric(vertical: 18, horizontal: 20),
        suffixIcon: suffix,
        hintText: hintText,
        hintStyle: AppTextStyle.regular(
          fontSize: 20.0,
          color: context.textPlaceholder,
        ),

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: BorderSide(color: context.textSurface, width: 1.3),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(
            color: AppColors.primaryColor,
            width: 1.3,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.0),
          borderSide: const BorderSide(color: Colors.red, width: 1.3),
        ),
      ),
      validator: (value) {
        return validator(value);
      },
    );
  }
}
