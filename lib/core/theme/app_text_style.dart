import 'package:flutter/cupertino.dart';

abstract class AppTextStyle {
  static TextStyle regular({required double fontSize, required Color color}) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle medium({required double fontSize, required Color color}) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w500,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle semiBold({required double fontSize, required Color color}) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w600,
      fontSize: fontSize,
      color: color,
    );
  }

  static TextStyle bold({required double fontSize, required Color color}) {
    return TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w700,
      fontSize: fontSize,
      color: color,
    );
  }
}
