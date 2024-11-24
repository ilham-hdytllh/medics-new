import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/helpers/network_manager.dart';
import '../../../core/utils/helpers/shared_preference.dart';
import '../../../core/utils/sncakbar/snackbar.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';

class ChangePasswordController extends GetxController {
  static ChangePasswordController get instance => Get.find();

  // Variable
  GlobalKey<FormState> changePasswordKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxBool obsecure1 = true.obs;
  RxBool obsecure2 = true.obs;
  final currentPassword = TextEditingController().obs;
  final newPassword = TextEditingController().obs;

  // Forgot Password
  Future<void> changePassword() async {
    try {
      // start loading
      isLoading.value = true;

      // check internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        isLoading.value = false;
        return;
      }

      // form validation
      if (!changePasswordKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }
      String? token = await SharedPreferencesHelper.getToken();

      // Register user in the firebase auth & save data in firebase
      await AuthenticationRepository.instance.updatePassword(token!,
          currentPassword.value.text.trim(), newPassword.value.text.trim());

      // clear all controller
      currentPassword.value.clear();
      newPassword.value.clear();

      CustomSnackbar.successSnackbar(
          title: "Success", message: "Password berhasil diubah.");
    } catch (e) {
      // show message generic eror to user
      CustomSnackbar.errorSnackbar(title: "Error", message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}
