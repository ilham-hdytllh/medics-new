import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class CustomTextFormFieldTheme {
  CustomTextFormFieldTheme._();

  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.only(left: 10),
    errorMaxLines: 3,
    prefixIconColor: CustomColors.darkGrey,
    suffixIconColor: CustomColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: CustomColors.black),
    hintStyle: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: CustomColors.darkGrey),
    errorStyle: const TextStyle().copyWith(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: CustomColors.error),
    floatingLabelStyle: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: CustomColors.primary.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomColors.grey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomColors.grey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomColors.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: CustomColors.error),
    ),
  );

  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    contentPadding: const EdgeInsets.only(left: 10),
    errorMaxLines: 3,
    prefixIconColor: CustomColors.darkGrey,
    suffixIconColor: CustomColors.darkGrey,
    // constraints: const BoxConstraints.expand(height: TSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: CustomColors.white),
    errorStyle: const TextStyle().copyWith(
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
        color: CustomColors.error),
    hintStyle: const TextStyle().copyWith(
        fontSize: 14.0,
        fontWeight: FontWeight.normal,
        color: CustomColors.softGrey),
    floatingLabelStyle: const TextStyle().copyWith(
        fontSize: 12.0,
        fontWeight: FontWeight.normal,
        color: CustomColors.white.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomColors.darkGrey),
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomColors.darkGrey),
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomColors.primary),
    ),
    errorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 1, color: CustomColors.error),
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
      borderRadius: BorderRadius.circular(CustomSizes.inputFieldRadius),
      borderSide: const BorderSide(width: 2, color: CustomColors.error),
    ),
  );
}
