import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class CustomTimePickerTheme {
  CustomTimePickerTheme._();

  static TimePickerThemeData lightTimePickerTheme = TimePickerThemeData(
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
    backgroundColor: CustomColors.white, // Background color
    hourMinuteTextColor: CustomColors.black, // Text color for hours and minutes
    dayPeriodTextColor: CustomColors.black, // Text color for AM/PM
    dayPeriodBorderSide: const BorderSide(
      color: CustomColors.black,
    ), // Border color for AM/PM
    dialHandColor: CustomColors.primary, // Color of the hour hand
    dialTextColor: CustomColors.black, // Text color on the clock dial
    dialBackgroundColor: Colors.deepOrangeAccent.withOpacity(0.2),
    dayPeriodColor: Colors.deepOrangeAccent.withOpacity(0.2),
    hourMinuteColor: Colors.deepOrangeAccent.withOpacity(0.2),
    entryModeIconColor: CustomColors.black,
    helpTextStyle: const TextStyle(
      color: CustomColors.black,
    ),
    hourMinuteTextStyle: const TextStyle(fontSize: 30),
  );

  static TimePickerThemeData darkTimePickerTheme = TimePickerThemeData(
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
    hourMinuteTextColor: CustomColors.softGrey,
    dayPeriodTextColor: CustomColors.softGrey,
    dayPeriodBorderSide: const BorderSide(
      color: CustomColors.primary,
    ),
    dialHandColor: CustomColors.softGrey,
    dialTextColor: CustomColors.black,
    dialBackgroundColor: CustomColors.primary,
    dayPeriodColor: CustomColors.primary,
    hourMinuteColor: CustomColors.primary,
    entryModeIconColor: CustomColors.softGrey,
    helpTextStyle: const TextStyle(
      color: CustomColors.softGrey,
    ),
    hourMinuteTextStyle: const TextStyle(fontSize: 30),
  );
}
