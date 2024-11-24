import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CustomSwitchheme {
  CustomSwitchheme._();

  static SwitchThemeData lightSwitchTheme = SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return CustomColors.primary;
      }
      if (states.contains(WidgetState.disabled)) {
        return CustomColors.darkGrey;
      }
      return CustomColors.darkGrey;
    }),
    trackColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.orangeAccent.withOpacity(0.2);
      }
      if (states.contains(WidgetState.disabled)) {
        return CustomColors.grey;
      }
      return CustomColors.grey;
    }),
    trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
  );

  static SwitchThemeData darkSwitchTheme = SwitchThemeData(
    thumbColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return CustomColors.primary;
      }
      if (states.contains(WidgetState.disabled)) {
        return CustomColors.lightGrey;
      }
      return CustomColors.lightGrey;
    }),
    trackColor: WidgetStateProperty.resolveWith((Set<WidgetState> states) {
      if (states.contains(WidgetState.selected)) {
        return Colors.orangeAccent.withOpacity(0.2);
      }
      if (states.contains(WidgetState.disabled)) {
        return CustomColors.grey;
      }
      return CustomColors.grey;
    }),
    trackOutlineColor: const WidgetStatePropertyAll(Colors.transparent),
  );
}
