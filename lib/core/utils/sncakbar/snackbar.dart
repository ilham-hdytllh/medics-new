import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:medics/core/utils/helpers/helper_functions.dart';

import '../../constants/colors.dart';

class CustomSnackbar {
  static hideSnackbar() =>
      ScaffoldMessenger.of(Get.context!).hideCurrentSnackBar();

  static customToast({required message}) {
    ScaffoldMessenger.of(Get.context!).showSnackBar(
      SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.transparent,
        content: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: CustomHelperFunctions.isDarkMode(Get.context!)
                ? CustomColors.darkGrey.withOpacity(0.9)
                : CustomColors.grey.withOpacity(0.9),
          ),
          child: Center(
              child: Text(
            message,
            style: Theme.of(Get.context!).textTheme.labelLarge,
          )),
        ),
      ),
    );
  }

  static successSnackbar({required title, message = ""}) {
    Get.snackbar(title, message,
        isDismissible: true,
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.only(left: 15, right: 15),
        borderRadius: 10,
        colorText: CustomColors.white,
        backgroundColor: CustomColors.success,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
        icon: const Icon(
          Iconsax.warning_2,
          color: CustomColors.white,
        ));
  }

  static warningSnackbar({required title, message = ""}) {
    Get.snackbar(title, message,
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.only(left: 15, right: 15),
        borderRadius: 10,
        isDismissible: true,
        colorText: CustomColors.white,
        backgroundColor: CustomColors.warning,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
        icon: const Icon(
          Iconsax.warning_2,
          color: CustomColors.white,
        ));
  }

  static errorSnackbar({required title, message = ""}) {
    Get.snackbar(title, message,
        padding: const EdgeInsets.all(6),
        margin: const EdgeInsets.only(left: 15, right: 15),
        borderRadius: 10,
        isDismissible: true,
        shouldIconPulse: true,
        colorText: CustomColors.white,
        backgroundColor: CustomColors.error,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 3),
        icon: const Icon(
          Iconsax.warning_2,
          color: CustomColors.white,
        ));
  }
}
