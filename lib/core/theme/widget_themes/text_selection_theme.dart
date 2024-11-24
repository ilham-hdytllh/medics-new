import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CustomTextSelectionTheme {
  CustomTextSelectionTheme._();

  static TextSelectionThemeData textSelectionTheme = TextSelectionThemeData(
      cursorColor: CustomColors.primary,
      selectionColor: CustomColors.primary,
      selectionHandleColor: CustomColors.primary);
}
