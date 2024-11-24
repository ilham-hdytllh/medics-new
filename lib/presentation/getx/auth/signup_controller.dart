import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/utils/helpers/network_manager.dart';
import '../../../core/utils/sncakbar/snackbar.dart';
import '../../../data/repositories/authentication/authentication_repository.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  // Variable
  GlobalKey<FormState> registerKey = GlobalKey<FormState>();
  RxBool isLoading = false.obs;
  RxBool obsecure = true.obs;
  RxBool privacyandpolicy = false.obs;
  final name = TextEditingController().obs;
  final email = TextEditingController().obs;
  final password = TextEditingController().obs;

  // Singup
  Future<void> singupWithEmailPassword() async {
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
      if (!registerKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }

      // Register user in the firebase auth & save data in firebase
      await AuthenticationRepository.instance.register(name.value.text.trim(),
          email.value.text.trim(), password.value.text.trim());

      // clear all controller
      name.value.clear();
      email.value.clear();
      password.value.clear();
      privacyandpolicy.value = false;
      obsecure.value = true;

      // show message generic eror to user
      CustomSnackbar.successSnackbar(
          title: "Success",
          message: "Akun berhasil di daftarkan, silahkan login");
    } catch (e) {
      // show message generic eror to user
      CustomSnackbar.errorSnackbar(title: "Error", message: e.toString());
    } finally {
      // remove loader
      isLoading.value = false;
    }
  }
}
