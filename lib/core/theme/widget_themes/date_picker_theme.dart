import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class CustomDatePickerTheme {
  CustomDatePickerTheme._();

  static DatePickerThemeData lightDatePickerTheme = DatePickerThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(CustomSizes.cardRadiusSm),
    ),
    elevation: 0,
    confirmButtonStyle: ButtonStyle(
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    cancelButtonStyle: ButtonStyle(
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    backgroundColor: CustomColors.white,
    surfaceTintColor: Colors.transparent,
    headerForegroundColor: CustomColors.white,
    headerBackgroundColor: CustomColors.primary,
    dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return CustomColors.primary;
      }
      return CustomColors.white;
    }),
    todayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return CustomColors.white;
      }
      return CustomColors.primary;
    }),
    todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return CustomColors.primary;
      }
      return CustomColors.white;
    }),
    yearBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return CustomColors.primary;
      }
      return CustomColors.white;
    }),
  );

  /// Customizable Dark Text Theme
  static DatePickerThemeData darkDatePickerTheme = DatePickerThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(CustomSizes.cardRadiusSm),
    ),
    elevation: 0,
    confirmButtonStyle: ButtonStyle(
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    cancelButtonStyle: ButtonStyle(
      textStyle: WidgetStateProperty.all(
        const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    backgroundColor: CustomColors.black,
    surfaceTintColor: Colors.transparent,
    headerForegroundColor: CustomColors.black,
    headerBackgroundColor: CustomColors.primary,
    dayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return CustomColors.primary;
      }
      return CustomColors.black;
    }),
    todayForegroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return CustomColors.black;
      }
      return CustomColors.primary;
    }),
    todayBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return CustomColors.primary;
      }
      return CustomColors.black;
    }),
    yearBackgroundColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return CustomColors.primary;
      }
      return CustomColors.black;
    }),
  );
}
