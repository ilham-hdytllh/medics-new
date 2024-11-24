import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/helpers/network_manager.dart';
import '../../../core/utils/sncakbar/snackbar.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  // Variable
  GlobalKey<FormState> forgotKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  final email = TextEditingController().obs;

  // Forgot Password
  Future<void> forgotPassword() async {
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
      if (!forgotKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      // Register user in the firebase auth & save data in firebase
      await AuthenticationRepository.instance
          .forgotPassword(email.value.text.trim());

      // clear all controller
      email.value.clear();

      CustomSnackbar.successSnackbar(
          title: "Success",
          message: "Link untuk reset password sudah dikirim ke email anda.");
    } catch (e) {
      // show message generic eror to user
      CustomSnackbar.errorSnackbar(title: "Error", message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}
