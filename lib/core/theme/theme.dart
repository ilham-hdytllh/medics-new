import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/sizes.dart';
import 'widget_themes/appbar_theme.dart';
import 'widget_themes/bottom_sheet_theme.dart';
import 'widget_themes/checkbox_theme.dart';
import 'widget_themes/chip_theme.dart';
import 'widget_themes/datatable_theme.dart';
import 'widget_themes/date_picker_theme.dart';
import 'widget_themes/elevated_button_theme.dart';
import 'widget_themes/outlined_button_theme.dart';
import 'widget_themes/switch_theme.dart';
import 'widget_themes/text_field_theme.dart';
import 'widget_themes/text_selection_theme.dart';
import 'widget_themes/text_theme.dart';
import 'widget_themes/time_picker_theme.dart';

class CustomAppTheme {
  CustomAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    dataTableTheme: CustomDataTableTheme.lightDataTableTheme,
    switchTheme: CustomSwitchheme.lightSwitchTheme,
    disabledColor: CustomColors.grey,
    brightness: Brightness.light,
    primaryColor: CustomColors.primary,
    textTheme: CustomTextTheme.lightTextTheme,
    chipTheme: CustomChipTheme.lightChipTheme,
    scaffoldBackgroundColor: CustomColors.white,
    appBarTheme: CustomAppBarTheme.lightAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.lightCheckboxTheme,
    datePickerTheme: CustomDatePickerTheme.lightDatePickerTheme,
    timePickerTheme: CustomTimePickerTheme.lightTimePickerTheme,
    bottomSheetTheme: CustomBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.lightInputDecorationTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: CustomColors.primary),
    ),
    textSelectionTheme: CustomTextSelectionTheme.textSelectionTheme,
    iconTheme: const IconThemeData(
      size: CustomSizes.iconMd,
      color: CustomColors.black,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    splashColor: Colors.transparent,
    highlightColor: Colors.transparent,
    dataTableTheme: CustomDataTableTheme.darkDataTableTheme,
    switchTheme: CustomSwitchheme.darkSwitchTheme,
    disabledColor: CustomColors.grey,
    brightness: Brightness.dark,
    primaryColor: CustomColors.primary,
    textTheme: CustomTextTheme.darkTextTheme,
    chipTheme: CustomChipTheme.darkChipTheme,
    scaffoldBackgroundColor: CustomColors.black,
    appBarTheme: CustomAppBarTheme.darkAppBarTheme,
    checkboxTheme: CustomCheckboxTheme.darkCheckboxTheme,
    datePickerTheme: CustomDatePickerTheme.darkDatePickerTheme,
    timePickerTheme: CustomTimePickerTheme.darkTimePickerTheme,
    bottomSheetTheme: CustomBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: CustomElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: CustomOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: CustomTextFormFieldTheme.darkInputDecorationTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: CustomColors.primary),
    ),
    textSelectionTheme: CustomTextSelectionTheme.textSelectionTheme,
    iconTheme: const IconThemeData(
      size: CustomSizes.iconMd,
      color: CustomColors.white,
    ),
  );
}
